FROM php:7.3.27-apache AS phphttpd


RUN apt-get update; \
    apt-get upgrade; \
    apt-get install -y git libpng-dev zip unzip libzip-dev

RUN docker-php-ext-install mysqli gd opcache pdo pdo_mysql mbstring zip

USER root
COPY openssl_configure.sh /home/docker_openssl_configure.sh
RUN chmod +x /home/docker_openssl_configure.sh
RUN /home/docker_openssl_configure.sh
#RUN rm /home/docker_openssl_configure.sh

#Composer
RUN php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');"; \
    php composer-setup.php --install-dir=/bin --filename composer; \
    php -r "unlink('composer-setup.php');"

#Install drush by composer
#RUN composer global require drush/drush
#RUN echo "export PATH=\"/root/.composer/vendor/bin:\$PATH\"" >> /root/.bashrc
#RUN echo 'xd'
#RUN cat /root/.bashrc
#RUN echo $PATH #/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
#RUN drush

#Config apache
RUN a2enmod rewrite deflate proxy proxy_fcgi ssl
# socache socache_shmcb
RUN service apache2 restart

COPY apache.conf /etc/apache2/conf-enabled/docker.apache.conf
#RUN echo "Include /usr/local/apache2/conf/docker.apache.conf" >> /usr/local/apache2/conf/httpd.conf

#RUN echo "<?php phpinfo(); ?>" > /var/www/html/index.php