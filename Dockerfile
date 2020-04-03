FROM php:7.2-apache

RUN apt-get update && apt-get install -y \
    && docker-php-ext-install mysqli && docker-php-ext-install pdo_mysql

RUN apt-get install -y build-essential libssl-dev zlib1g-dev libpng-dev libjpeg-dev libfreetype6-dev
RUN docker-php-ext-configure gd --with-freetype-dir=/usr/include/ --with-jpeg-dir=/usr/include/ \
    && docker-php-ext-install gd
RUN apachectl restart

RUN a2enmod rewrite