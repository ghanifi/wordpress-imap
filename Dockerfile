FROM wordpress:php8.2-apache

# IMAP için gerekli paketler
RUN apt-get update && apt-get install -y \
    libc-client-dev \
    libkrb5-dev \
    && rm -rf /var/lib/apt/lists/*

# PHP IMAP extension aktif et
RUN docker-php-ext-configure imap --with-kerberos --with-imap-ssl \
    && docker-php-ext-install imap

# Apache mod rewrite aktif et
RUN a2enmod rewrite