#!/bin/bash
echo "Creating backup of web application..."
# Define paths
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
SRC_DIR="$SCRIPT_DIR/../web"
DEST_DIR="$SCRIPT_DIR/../web_backup"
TAR_FILE="$SCRIPT_DIR/../docker/web/image/app.tar.gz"

# Remove previous backup if exists
rm -rf "$DEST_DIR" "$TAR_FILE"

# Copy the app folder
cp -r "$SRC_DIR" "$DEST_DIR"

# Remove vendor directory from the copied folder
rm -rf "$DEST_DIR/vendor"
rm -rf "$DEST_DIR/var/cache"
rm -rf "$DEST_DIR/var/log"

# Create a tar archive containing only the contents of `app_backup`
tar -czf "$TAR_FILE" -C "$DEST_DIR" .

# Cleanup copied directory
rm -rf "$DEST_DIR"

echo "Backup for web application created: $TAR_FILE"
