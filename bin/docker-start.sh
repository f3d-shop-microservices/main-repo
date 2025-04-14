#!/bin/bash
PROD="$1"
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
cd "$SCRIPT_DIR/../docker"
docker-compose down

cd "$SCRIPT_DIR/../docker"


if [ "$PROD" = "true" ]; then
  docker-compose -f docker-compose.yml up -d --build
else
  docker-compose up -d --build
fi

