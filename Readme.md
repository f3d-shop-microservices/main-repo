# Shop Microservices
![Схема архитектуры](specs/web-architecture.png)
## Structure
- **Nginx Reverse-proxy** - lb entry point to frontend and api-gateway
- **Web application** - frontend application
- **API Gateway** — routing and security
- **Consul** — Service discovery
- **Auth Service** — microservice for authentication
- **Auth Service DB** — Mysql db for Auth microservice
- **Product Service** — microservice with products business logic
- **Product Service DB** — Mysql db for Product microservice

Installation

Clone from git:
git clone --recurse-submodules git@github.com:f3d-shop-microservices/main-repo.git

Make sure on your local machine you have php8.1, Composer, OpenSSL, Make installed
Run:
make init
make start PROD=true

also modify hosts file with:
127.0.0.1   front.shopmicro.local
127.0.0.1   api.shopmicro.local

Enjoy