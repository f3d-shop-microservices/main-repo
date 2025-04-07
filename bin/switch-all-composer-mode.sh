#!/bin/bash

MODE=$1

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

if [[ $MODE == "prod" ]]; then
  bash "$SCRIPT_DIR/switch-composer-mode.sh" prod web
  bash "$SCRIPT_DIR/switch-composer-mode.sh" prod services/gateway
  bash "$SCRIPT_DIR/switch-composer-mode.sh" prod services/auth
  bash "$SCRIPT_DIR/switch-composer-mode.sh" prod services/product
elif [[ $MODE == "dev" ]]; then
    bash "$SCRIPT_DIR/switch-composer-mode.sh" dev web
    bash "$SCRIPT_DIR/switch-composer-mode.sh" dev services/gateway
    bash "$SCRIPT_DIR/switch-composer-mode.sh" dev services/auth
    bash "$SCRIPT_DIR/switch-composer-mode.sh" dev services/product
fi
