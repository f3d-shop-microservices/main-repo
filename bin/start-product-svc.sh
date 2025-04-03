#!/bin/bash

# Fail on any error
set -e

# Define the base directory of your script
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

echo "Starting database container for product..."
cd "$SCRIPT_DIR/../docker"
docker-compose up -d product-svc-db

echo "Starting Symfony server in product..."
cd "$SCRIPT_DIR/../services/product"
symfony server:start --no-tls --port=8002