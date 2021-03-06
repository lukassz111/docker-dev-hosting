FROM php:7.3.27-fpm-alpine
USER root

RUN apk update; \
    apk upgrade; \
    apk add libpng-dev libpng git

RUN docker-php-ext-install mysqli gd opcache pdo pdo_mysql mbstring

RUN php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');"; \
    php composer-setup.php --install-dir=/bin --filename composer; \
    php -r "unlink('composer-setup.php');"