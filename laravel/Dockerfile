# Dockerfile
FROM php:8.2-fpm

# Install system dependencies
RUN apt-get update && apt-get install -y \
    libzip-dev \
    libmagickwand-dev \
    libexif-dev \
    unzip \
    && docker-php-ext-install zip bcmath exif \
    && pecl install imagick \
    && docker-php-ext-enable imagick \
    && docker-php-ext-configure exif --enable-exif

# Clean up to reduce image size
RUN apt-get clean && rm -rf /var/lib/apt/lists/*

# Set working directory
WORKDIR /var/www
