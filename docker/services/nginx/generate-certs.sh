#!/bin/bash

set -e

CERT_DIR="$(dirname "$0")/certs"
CONFIG="$(dirname "$0")/openssl.cnf"
KEY="$CERT_DIR/nginx-selfsigned.key"
CERT="$CERT_DIR/nginx-selfsigned.crt"

echo "Generating self-signed certificate..."
openssl req \
  -x509 \
  -nodes \
  -days 365 \
  -newkey rsa:2048 \
  -keyout "$KEY" \
  -out "$CERT" \
  -config "$CONFIG"

echo "Certificate generated:"
echo " - Key:  $KEY"
echo " - Cert: $CERT"
