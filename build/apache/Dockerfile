FROM httpd:2.4.33-alpine
RUN apk update; \
    apk upgrade;
# Copy apache vhost file to proxy php requests to php-fpm container
COPY apache.conf /usr/local/apache2/conf/docker.apache.conf
COPY openssl_configure.sh /usr/local/apache2/docker_openssl_configure.sh
RUN /usr/local/apache2/docker_openssl_configure.sh
RUN rm /usr/local/apache2/docker_openssl_configure.sh
USER root
RUN echo "xd"
RUN echo "Include /usr/local/apache2/conf/docker.apache.conf" >> /usr/local/apache2/conf/httpd.conf