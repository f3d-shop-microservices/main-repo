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

