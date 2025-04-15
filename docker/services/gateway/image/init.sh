#!/bin/sh
set -e

export SERVICE_HOST=$(hostname)
export APP_PORT=8080
echo "Starting with SERVICE_HOST=$SERVICE_HOST and APP_PORT=$APP_PORT"

echo "Registering service in Consul..."
php bin/console app:service-discovery:register

echo "Starting original entrypoint..."
exec /start.sh
