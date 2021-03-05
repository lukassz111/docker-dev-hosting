FROM php:7.3.27-fpm-alpine
RUN apk update; \
    apk upgrade;
RUN docker-php-ext-install mysqli
RUN apk add libpng-dev
RUN apk add libpng
RUN docker-php-ext-install gd
RUN docker-php-ext-install opcache
RUN docker-php-ext-install pdo
RUN docker-php-ext-install pdo_mysql
RUN docker-php-ext-install mbstring
USER root
RUN php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');"
RUN php composer-setup.php
RUN php -r "unlink('composer-setup.php');"
RUN apk add git