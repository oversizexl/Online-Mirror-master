#!/usr/bin/env node

const { spawn } = require('child_process');
const path = require('path');
const http = require('http');
const { exec } = require('child_process');

console.log('========================================');
console.log('  本地完整测试环境');
console.log('========================================');
console.log('');
console.log('启动服务：');
console.log('  - 前端: http://localhost:8080');
console.log('  - API:  http://localhost:8787');
console.log('');
console.log('提示：确保 config.js 中 API_BASE_URL = "http://localhost:8787"');
console.log('按 Ctrl+C 停止所有服务');
console.log('========================================');
console.log('');

const isWindows = process.platform === 'win32';

// 启动前端服务器
const frontend = spawn('npx', ['serve', '-p', '8080'], {
  cwd: path.join(__dirname, '..'),
  stdio: 'inherit',
  shell: isWindows
});

// 启动 Worker
const worker = spawn('npx', ['wrangler', 'dev'], {
  cwd: path.join(__dirname, '..'),
  stdio: 'inherit',
  shell: isWindows
});

// 等待前端服务启动后打开浏览器
setTimeout(() => {
  const checkServer = () => {
    http.get('http://localhost:8080', (res) => {
      if (res.statusCode === 200) {
        openBrowser('http://localhost:8080');
      } else {
        setTimeout(checkServer, 500);
      }
    }).on('error', () => {
      setTimeout(checkServer, 500);
    });
  };
  checkServer();
}, 1000);

// 自动打开浏览器
function openBrowser(url) {
  let command;
  
  if (isWindows) {
    command = `start ${url}`;
  } else if (process.platform === 'darwin') {
    command = `open ${url}`;
  } else {
    command = `xdg-open ${url}`;
  }
  
  exec(command, (err) => {
    if (err) {
      console.log(`\n💡 请手动打开浏览器访问: ${url}`);
    } else {
      console.log(`\n✅ 浏览器已打开: ${url}`);
    }
  });
}

// 处理退出
const cleanup = () => {
  console.log('\n正在停止服务...');
  frontend.kill();
  worker.kill();
  process.exit(0);
};

process.on('SIGINT', cleanup);
process.on('SIGTERM', cleanup);

frontend.on('error', (err) => {
  console.error('前端服务启动失败:', err.message);
  cleanup();
});

worker.on('error', (err) => {
  console.error('Worker 启动失败:', err.message);
  cleanup();
});

