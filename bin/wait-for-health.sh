#!/bin/bash

SERVICES=(
  "http://localhost:8000/health"
  "http://localhost:8080/health"
  "http://localhost:8080/api/auth/health"
  "http://localhost:8080/api/product/health"
)

echo "Waiting for services to become healthy..."
spinner="/-\|"
spin=0

while true; do
  all_ok=true
  for url in "${SERVICES[@]}"; do
    if ! curl -fsS "$url" > /dev/null 2>&1; then
      all_ok=false
      break
    fi
  done
  if $all_ok; then
    break
  fi
  printf "\r%c Checking health..." "${spinner:spin++%4:1}"
  sleep 1
done

echo -e "\rAll services are healthy and ready.           "
