# Dockerfile (inside docker-setup/dev)

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
    && docker-php-ext-install gd pdo pdo_mysql exif opcache

RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

WORKDIR /var/www/html

COPY emr-php /var/www/html

RUN composer install --no-scripts --prefer-dist --no-dev

COPY ../php/local.ini /usr/local/etc/php/conf.d/
COPY ../nginx/api.conf /etc/nginx/nginx.conf

EXPOSE 80

CMD ["sh", "-c", "php-fpm & nginx -g 'daemon off;'"]
