#!/bin/sh
set -e

echo "Waiting for DB to be ready..."
/usr/local/bin/wait-for-it.sh auth-svc-db:3306 --timeout=60 --strict -- echo "DB is up!"

echo "Creating database..."
php bin/console doctrine:database:create --if-not-exists || true

echo "Applying migrations..."
php bin/console doctrine:migrations:migrate --no-interaction

echo "Loading fixtures..."
php bin/console doctrine:fixtures:load --no-interaction

echo "Starting original entrypoint..."
exec /start.sh
