@echo off
chcp 65001 >nul
echo ========================================
echo  本地测试服务器
echo ========================================
echo.
echo 正在启动本地服务器...
echo 访问地址: http://localhost:8080/home.html
echo.
echo 按 Ctrl+C 停止服务器
echo ========================================
echo.

cd /d "%~dp0\.."
python -m http.server 8080

