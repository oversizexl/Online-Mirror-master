@echo off
setlocal enabledelayedexpansion
chcp 65001 >nul
cls

echo ================================================
echo   Online Mirror - Cloudflare 一键部署脚本
echo ================================================
echo.

echo [*] 检查环境...
echo.

where node >nul 2>&1
if %errorlevel% neq 0 (
    echo [X] 未找到 Node.js
    echo 请先安装 Node.js: https://nodejs.org/
    echo.
    pause
    exit /b 1
) else (
    echo [OK] Node.js 已安装
)

where npm >nul 2>&1
if %errorlevel% neq 0 (
    echo [X] 未找到 npm
    echo 请先安装 Node.js: https://nodejs.org/
    echo.
    pause
    exit /b 1
) else (
    echo [OK] npm 已安装
)

echo.
echo [*] 安装 Wrangler...
call npm install -g wrangler
if %errorlevel% neq 0 (
    echo [X] 安装 Wrangler 失败
    echo.
    pause
    exit /b 1
)
echo [OK] Wrangler 安装完成

echo.
echo [*] 登录 Cloudflare...
call wrangler login
if %errorlevel% neq 0 (
    echo [X] Cloudflare 登录失败
    echo.
    pause
    exit /b 1
)
echo [OK] Cloudflare 登录成功

echo.
echo [*] 创建 R2 存储桶...
call wrangler r2 bucket create photos
if %errorlevel% neq 0 (
    echo [!] R2 存储桶创建失败或已存在，继续...
)
echo [OK] R2 存储桶准备完成

echo.
echo [*] 部署 Worker...
call wrangler deploy
if %errorlevel% neq 0 (
    echo [X] Worker 部署失败
    echo.
    pause
    exit /b 1
)
echo [OK] Worker 部署成功

echo.
echo [*] 部署前端到 Pages...
call npx wrangler pages deploy . --project-name=online-mirror --branch=main --commit-dirty=true
if %errorlevel% neq 0 (
    echo [X] Pages 部署失败
    echo.
    pause
    exit /b 1
)
echo [OK] Pages 部署成功

echo.
echo ================================================
echo   [OK] 部署完成！
echo ================================================
echo.
echo [*] 接下来的步骤：
echo.
echo 1. 访问你的 Pages URL 查看网站
echo 2. 在 Cloudflare Dashboard 中配置自定义域名（可选）
echo 3. 查看 DEPLOY.md 了解更多配置选项
echo.
echo [OK] 享受完全免费的云服务吧！
echo.
pause
endlocal

