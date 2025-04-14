#!/bin/bash
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
cd "$SCRIPT_DIR/../docker"
docker-compose up -d --build consul

bash "$SCRIPT_DIR/start-webapp.sh"
bash "$SCRIPT_DIR/start-api-gateway-svc.sh"
bash "$SCRIPT_DIR/start-auth-svc.sh"
bash "$SCRIPT_DIR/start-product-svc.sh"

bash "$SCRIPT_DIR/start-nginx.sh"

symfony server:list