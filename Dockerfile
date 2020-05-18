FROM composer:1.9.3 AS composer

FROM debian:buster-slim

# copy the Composer PHAR from the Composer image into the PHP image
COPY --from=composer /usr/bin/composer /usr/bin/composer

RUN apt-get update && \
    apt-get install --no-install-recommends -y php-cli ssh rsync && \
    apt-get clean