# ==========================================
# Stage 1: Vendor & PHP Dependencies
# ==========================================
FROM composer:2 AS vendor_builder
WORKDIR /app
COPY composer.json composer.lock ./
RUN composer install --no-dev --prefer-dist --optimize-autoloader --no-scripts --no-interaction --ignore-platform-reqs

# ==========================================
# Stage 2: Build Frontend Assets (Vite)
# ==========================================
FROM node:20-alpine AS asset_builder
WORKDIR /app

COPY package*.json ./
RUN npm ci || npm install

COPY resources ./resources
COPY vite.config.js tailwind.config.js postcss.config.js* ./
RUN npm run build

# ==========================================
# Stage 3: Production PHP + Nginx Application
# ==========================================
FROM php:8.3-fpm-alpine

LABEL maintainer="Forum TIPD PTKIN - BalaKutaK CMS"
WORKDIR /var/www/html

# Install dependencies
RUN apk add --no-cache \
    nginx \
    supervisor \
    bash \
    git \
    curl \
    zip \
    unzip \
    mariadb-client \
    freetype-dev \
    libjpeg-turbo-dev \
    libpng-dev \
    libzip-dev \
    icu-dev

# Install PHP extensions
RUN docker-php-ext-configure gd --with-freetype --with-jpeg \
    && docker-php-ext-install -j$(nproc) \
        pdo_mysql \
        mysqli \
        zip \
        gd \
        bcmath \
        intl \
        pcntl \
        exif

# Setup Nginx, Supervisord & Entrypoint
RUN mkdir -p /run/nginx /var/log/supervisor /var/log/nginx
COPY docker/nginx.conf /etc/nginx/http.d/default.conf
COPY docker/php.ini /usr/local/etc/php/conf.d/custom.ini
COPY docker/supervisord.conf /etc/supervisor/conf.d/supervisord.conf
COPY docker/entrypoint.sh /usr/local/bin/entrypoint.sh
RUN chmod +x /usr/local/bin/entrypoint.sh

# Copy application source code
COPY . /var/www/html

# Copy vendor dari Stage 1
COPY --from=vendor_builder /app/vendor /var/www/html/vendor

# Copy compiled frontend assets dari Stage 2
COPY --from=asset_builder /app/public/build /var/www/html/public/build

# Permissions
RUN chown -R www-data:www-data /var/www/html/storage /var/www/html/bootstrap/cache \
    && chmod -R 775 /var/www/html/storage /var/www/html/bootstrap/cache

EXPOSE 80

ENTRYPOINT ["/usr/local/bin/entrypoint.sh"]
CMD ["/usr/bin/supervisord", "-c", "/etc/supervisor/conf.d/supervisord.conf"]
