# Use the existing image as the base
FROM richarvey/nginx-php-fpm:latest

# Set working directory inside the container
WORKDIR /var/www/html

# Copy your application files into the container
COPY ./image/app.tar.gz /var/www/html
RUN tar -xzf app.tar.gz -C /var/www/html
RUN rm app.tar.gz

# Ensure proper permissions
RUN chown -R www-data:www-data /var/www/html

COPY ./image/init.sh /init.sh
RUN chmod +x /init.sh

# Install Composer dependencies (optional: you can skip it in Dockerfile)
RUN composer install --no-interaction

# Compile assets
RUN php bin/console asset-map:compile

# Ensure start script is executable
RUN chmod +x /start.sh

# Define the command to start the container
CMD ["/init.sh"]
