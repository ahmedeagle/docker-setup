FROM php:7.2-fpm-alpine as base

RUN apk add --no-cache \
    nginx \
    libpng-dev \
    libjpeg-turbo-dev \
    libfreetype6-dev \
    zip \
    git \
    bash \
    && docker-php-ext-configure gd --with-freetype --with-jpeg \
    && docker-php-ext-install gd pdo pdo_mysql opcache

RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

WORKDIR /var/www/html

COPY ../emr-php /var/www/html

RUN composer install --no-scripts --prefer-dist --no-dev

COPY ./nginx/api.conf /etc/nginx/nginx.conf

EXPOSE 80

# Run PHP-FPM and Nginx
CMD ["sh", "-c", "php-fpm & nginx -g 'daemon off;'"]
