#!/bin/bash

# Fail on any error
set -e

# Define the base directory of your script
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

echo "Starting container for nginx..."
cd "$SCRIPT_DIR/../docker"
GATEWAY_HOST=host.docker.internal GATEWAY_PORT=8001 docker-compose up -d nginx