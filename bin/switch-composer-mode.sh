#!/bin/bash

MODE=$1
TARGET_DIR=$2

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
TARGET_DIR="$SCRIPT_DIR/../$TARGET_DIR"

if [[ -z "$MODE" || -z "$TARGET_DIR" ]]; then
  echo "Usage: ./switch-composer-mode.sh [prod|dev] /path/to/microservice"
  exit 1
fi

LOCAL_JSON="$TARGET_DIR/composer.local.json"
LOCAL_DEV="$TARGET_DIR/composer.local.dev"

if [[ $MODE == "prod" ]]; then
  mv "$LOCAL_JSON" "$LOCAL_DEV" 2>/dev/null
  sleep 0.5
  composer --working-dir="$TARGET_DIR" update f3d/shop-common --no-scripts
elif [[ $MODE == "dev" ]]; then
  mv "$LOCAL_DEV" "$LOCAL_JSON" 2>/dev/null
  cd "$TARGET_DIR"
  sleep 0.5
  composer update f3d/shop-common --no-scripts
else
  echo "Usage: ./switch-composer-mode.sh [prod|dev] /path/to/microservice"
fi
