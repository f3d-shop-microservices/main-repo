#!/bin/bash

# Fail on any error
set -e

# Define the base directory of your script
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

echo "Starting database container for auth..."
cd "$SCRIPT_DIR/../docker"
docker-compose up -d auth-svc-db

echo "Starting Symfony server in Auth..."
cd "$SCRIPT_DIR/../services/auth"
php bin/console app:service-discovery:register
symfony server:start -d --no-tls --port=8003