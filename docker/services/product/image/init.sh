#!/bin/sh
set -e

export SERVICE_HOST=$(hostname)
export APP_PORT=8080
echo "Starting with SERVICE_HOST=$SERVICE_HOST and APP_PORT=$APP_PORT"

echo "Waiting for DB to be ready..."
/usr/local/bin/wait-for-it.sh product-svc-db:3306 --timeout=60 --strict -- echo "DB is up!"

echo "Creating database..."
php bin/console doctrine:database:create --if-not-exists || true

echo "Applying migrations..."
php bin/console doctrine:migrations:migrate --no-interaction

echo "Loading fixtures..."
php bin/console doctrine:fixtures:load --no-interaction

echo "Registering service in Consul..."
php bin/console app:service-discovery:register

echo "Starting original entrypoint..."
exec /start.sh
