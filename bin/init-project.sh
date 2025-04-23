#!/bin/bash
#git clone --recurse-submodules git@github.com:f3d-shop-microservices/main-repo.git

# Fail on any error
set -e

# Define the base directory of your script
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

echo "Bootstrapping Web..."
cd "$SCRIPT_DIR/../web"
php bin/console app:init-env-local

echo "Bootstrapping Auth..."
cd "$SCRIPT_DIR/../services/auth"
php bin/console app:init-env-local
php bin/console app:init-jwt

echo "Bootstrapping Gateway..."
cd "$SCRIPT_DIR/../services/gateway"
php bin/console app:init-env-local

echo "Bootstrapping Product..."
cd "$SCRIPT_DIR/../services/product"
php bin/console app:init-env-local

echo "Preparing tars..."
cd "$SCRIPT_DIR/../bin"
./pull-artifacts.sh