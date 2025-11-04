# 🛠️ 脚本索引

本目录包含所有部署和测试脚本。

## 📋 脚本列表

### 本地测试脚本

| 脚本 | 平台 | 功能 | 命令 |
|------|------|------|------|
| `test-local.bat` | Windows | 启动本地前端服务器 | 双击运行 或 `pnpm run test` |
| `test-local.sh` | Linux/Mac | 启动本地前端服务器 | `./test-local.sh` |
| `start-test.js` | 跨平台 | 同时启动前端+Worker | `pnpm run test-full` |

**说明**：
- 仅测试前端：`pnpm run test` → 访问 http://localhost:8080
- 测试完整功能：`pnpm run test-full` → 前端+Worker同时启动

---

### 部署脚本

| 脚本 | 平台 | 功能 | 命令 |
|------|------|------|------|
| `deploy-main.bat` | Windows | 部署前端到 main 分支 | 双击运行 |
| `deploy-main.sh` | Linux/Mac | 部署前端到 main 分支 | `./deploy-main.sh` |
| `deploy.bat` | Windows | 完整部署（前端+Worker） | 双击运行 |
| `deploy.sh` | Linux/Mac | 完整部署（前端+Worker） | `./deploy.sh` |

**说明**：
- `deploy-main.*` - 仅部署前端到 Cloudflare Pages（main分支）
- `deploy.*` - 同时部署前端和Worker

---

### 诊断脚本

| 脚本 | 平台 | 功能 |
|------|------|------|
| `test-dns.bat` | Windows | 诊断Worker API连接问题 |

**说明**：
- 用于排查API无法访问的问题
- 测试DNS解析和网络连接

---

## 🔧 使用指南

### 快速开始

```bash
# 0. 安装依赖（首次）
pnpm install

# 1. 本地测试
pnpm run test

# 2. 完整功能测试（需两个终端）
pnpm run test-full

# 3. 部署到生产环境
./scripts/deploy.sh  # 或 deploy.bat
```

### 注意事项

- 本项目使用 **pnpm** 作为包管理器（见 `pnpm-lock.yaml`）
- 执行 `.sh` 脚本前需要添加执行权限：`chmod +x *.sh`
- 部署前确保已安装 `wrangler` 并登录 Cloudflare
- 本地测试时确保端口 8080 和 8787 未被占用

---

## 📝 维护规则

1. **可重用脚本**：保留并更新此索引
2. **临时脚本**：测试完成后立即删除
3. **新增脚本**：
   - 放在此目录
   - 更新本索引文档
   - 添加到 `package.json` scripts（如适用）

---

## 🚀 pnpm 命令映射

| pnpm 命令 | 对应脚本 | 说明 |
|----------|----------|------|
| `pnpm run test` | `test-local.*` | 启动前端服务器 |
| `pnpm run test-full` | `start-test.js` | 启动前端+Worker |
| `pnpm run dev-worker` | wrangler dev | 启动Worker开发服务器 |
| `pnpm run deploy-worker` | wrangler deploy | 部署Worker |

**推荐使用 pnpm 命令**，自动选择对应平台脚本。

> 📦 本项目使用 **pnpm** 作为包管理器，提供更快的安装速度和更少的磁盘占用。
