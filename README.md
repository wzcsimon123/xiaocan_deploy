# 小蚕 (xiaocan) 一键部署

基于 Docker Compose，**无需编译**，拉取镜像即可运行。

## 镜像

| 服务 | 镜像 |
|------|------|
| 后端 | `wzcsimon/xiaocan-backend:latest` |
| 前端 | `wzcsimon/xiaocan-frontend:latest` |
| MySQL / Redis / Nginx | 官方镜像 |

## 一键启动

```bash
# 1. 解压到任意目录
cd xiaocan-deploy

# 2. 按需修改 .env（密码、端口、SYSTEM_WEB_URL）
vi .env

# 3. 一键部署
chmod +x install.sh
./install.sh
```

或手动：

```bash
docker compose pull
docker compose up -d
```

浏览器打开：`http://服务器IP`（默认 80 端口）

## 目录说明

```
xiaocan-deploy/
├── install.sh           # 一键脚本
├── docker-compose.yml
├── .env                 # 配置（改这里）
├── nginx/nginx.conf
└── mysql/init/01-ddl.sql
```



## 配置说明（.env）

| 变量 | 说明 |
|------|------|
| HTTP_PORT | 网站端口，默认 80 |
| MYSQL_* | 数据库账号密码 |
| SYSTEM_WEB_URL | 公网访问地址，末尾不要 `/` |
| IMAGE_TAG | 镜像标签，默认 latest |

