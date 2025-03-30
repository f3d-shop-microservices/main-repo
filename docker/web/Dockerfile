# Use the existing image as the base
FROM richarvey/nginx-php-fpm:latest

# Set working directory inside the container
WORKDIR /var/www/html

# Copy your application files into the container
COPY ./image/app.tar.gz /var/www/html
RUN tar -xzf app.tar.gz -C /var/www/html



# Ensure proper permissions
RUN chown -R www-data:www-data /var/www/html

# Install Composer dependencies (optional: you can skip it in Dockerfile)
RUN composer install --no-interaction

# Compile assets
RUN php bin/console asset-map:compile

# Ensure start script is executable
RUN chmod +x /start.sh

# Define the command to start the container
CMD ["/start.sh"]
