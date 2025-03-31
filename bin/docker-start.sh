#!/bin/bash
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
cd "$SCRIPT_DIR/../docker"
docker-compose down

bash "$SCRIPT_DIR/pull-artifacts.sh"

cd "$SCRIPT_DIR/../docker"
docker-compose up -d --build

echo "Preparing all the services..."