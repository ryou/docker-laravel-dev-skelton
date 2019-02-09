FROM php:7.2.13-apache
RUN apt-get update && \
  docker-php-ext-install pdo_mysql
