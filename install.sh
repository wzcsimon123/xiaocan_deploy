#!/bin/bash
set -e

cd "$(dirname "$0")"

echo "=========================================="
echo "  小蚕 xiaocan 一键部署"
echo "=========================================="

if ! command -v docker >/dev/null 2>&1; then
  echo "[错误] 未安装 Docker，请先安装 Docker / Docker Compose"
  exit 1
fi

if ! docker compose version >/dev/null 2>&1; then
  echo "[错误] 需要 Docker Compose V2（docker compose）"
  exit 1
fi

if [ ! -f .env ]; then
  echo "[错误] 缺少 .env 文件"
  exit 1
fi

# 可选：从环境变量覆盖镜像仓库（默认 wzcsimon）
# 一般无需修改

echo "[1/3] 拉取镜像..."
docker compose pull

echo "[2/3] 启动服务..."
docker compose up -d

echo "[3/3] 等待服务就绪..."
sleep 5
docker compose ps

HTTP_PORT=$(grep -E '^HTTP_PORT=' .env 2>/dev/null | cut -d= -f2 || echo 80)
HTTP_PORT=${HTTP_PORT:-80}

echo ""
echo "=========================================="
echo "  部署完成"
echo "  访问: http://服务器IP:${HTTP_PORT}"
echo "  日志: docker compose logs -f"
echo "  停止: docker compose down"
echo "=========================================="
