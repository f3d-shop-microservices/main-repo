#!/bin/bash

# Fail on any error
set -e

# Define the base directory of your script
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

echo "Starting Symfony server in Gateway..."
cd "$SCRIPT_DIR/../services/gateway"
php bin/console app:service-discovery:register
symfony server:start -d --no-tls --port=8001