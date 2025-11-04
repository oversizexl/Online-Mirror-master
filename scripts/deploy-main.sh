#!/bin/bash

echo "================================================"
echo "  部署到 Main（自定义域名）"
echo "================================================"
echo ""

npx wrangler pages deploy . --project-name=online-mirror --branch=main --commit-dirty=true

echo ""
echo "================================================"
echo "  部署完成！"
echo "================================================"
echo ""
echo "您的自定义域名将在1-5分钟内更新"
echo "https://zk9999902.dpdns.org/home"

