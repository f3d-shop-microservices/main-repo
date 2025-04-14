#!/bin/sh
set -e

echo "Registering service in Consul..."
php bin/console app:service-discovery:register

echo "Starting original entrypoint..."
exec /start.sh
