#!/bin/bash

# Fail on any error
set -e

# Define the base directory of your script
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# Start Symfony server in folder-a
echo "Starting Symfony server in web..."
cd "$SCRIPT_DIR/../web"
symfony server:start -d  --no-tls --port=8000