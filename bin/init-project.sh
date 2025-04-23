#!/bin/bash
#git clone --recurse-submodules git@github.com:f3d-shop-microservices/main-repo.git

# Fail on any error
set -e

# Define the base directory of your script
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

echo "Bootstrapping Web..."
cd "$SCRIPT_DIR/../web"
composer install
php bin/console app:init-env-local

echo "Bootstrapping Auth..."
cd "$SCRIPT_DIR/../services/auth"
composer install
php bin/console app:init-env-local
php bin/console app:init-jwt

echo "Bootstrapping Gateway..."
cd "$SCRIPT_DIR/../services/gateway"
composer install
php bin/console app:init-env-local

echo "Bootstrapping Product..."
cd "$SCRIPT_DIR/../services/product"
composer install
php bin/console app:init-env-local

echo "Bootstrapping Nginx..."
cd "$SCRIPT_DIR/../docker/services/nginx"
chmod +x generate-certs.sh
./generate-certs.sh

echo "Preparing tars..."
cd "$SCRIPT_DIR/../bin"
./pull-artifacts.sh