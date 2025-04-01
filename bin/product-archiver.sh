#!/bin/bash
echo "Creating backup for product-svc..."
# Define paths
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
SRC_DIR="$SCRIPT_DIR/../services/product"
DEST_DIR="$SCRIPT_DIR/../services/product_backup"
TAR_FILE="$SCRIPT_DIR/../docker/services/product/image/app.tar.gz"

# Remove previous backup if exists
rm -rf "$DEST_DIR" "$TAR_FILE"

cd "$SRC_DIR" || exit 1

# Copy the app folder
mkdir -p "$DEST_DIR"
find . -type d \( -name 'vendor' -o -name 'var' \) -prune -o -print | while read path; do
  if [ -d "$path" ]; then
    mkdir -p "$DEST_DIR/$path"
  else
    mkdir -p "$(dirname "$DEST_DIR/$path")"
    cp "$path" "$DEST_DIR/$path"
  fi
done

# Create a tar archive containing only the contents of `app_backup`
tar -czf "$TAR_FILE" -C "$DEST_DIR" .

# Cleanup copied directory
rm -rf "$DEST_DIR"

echo "Backup for product-svc created: $TAR_FILE"
