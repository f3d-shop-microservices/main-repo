#!/bin/bash
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

bash "$SCRIPT_DIR/webapp-archiver.sh"
bash "$SCRIPT_DIR/gateway-archiver.sh"
bash "$SCRIPT_DIR/auth-archiver.sh"
bash "$SCRIPT_DIR/product-archiver.sh"
