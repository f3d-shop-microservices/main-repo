#!/bin/bash

# Fail on any error
set -e

# Define the base directory of your script
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

echo "Starting Symfony server in Gateway..."
cd "$SCRIPT_DIR/../services/gateway"
symfony server:start --no-tls --port=8001