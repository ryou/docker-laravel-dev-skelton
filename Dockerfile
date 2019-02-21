FROM php:7.2.13-apache
RUN apt-get update && \
  docker-php-ext-install pdo_mysql

# Rewriteを有効にするために必要
RUN cd /etc/apache2/mods-enabled \
    && ln -s ../mods-available/rewrite.load

# xdebugの有効化
RUN pecl install xdebug
