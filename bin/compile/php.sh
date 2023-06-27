#!/bin/bash

# Usage:
#   bash php.sh {TAG}

readonly GITURL='https://github.com/php/php-src.git'
readonly SRCPATH='/usr/local/src/php'
readonly PREFIX='/opt/php'
readonly TAG="$1"

if [ -z "$TAG" ]; then
    echo 'Argument {TAG} is empty.'
    exit 1
fi

if [ -d "$SRCPATH" ]; then
    echo "Remove $SRCPATH"
    rm -rf "$SRCPATH"

    echo "Remove $PREFIX"
    sudo rm -rf "$PREFIX"
fi

git clone --depth 1 -b "$TAG" "$GITURL" "$SRCPATH"
cd "$SRCPATH" || exit 1

sudo systemctl stop php-fpm
./buildconf --force
./configure \
    --prefix="$PREFIX" \
    --with-libdir=lib64 \
    --enable-fpm \
    --enable-phpdbg \
    --enable-bcmath \
    --enable-exif \
    --enable-mbstring \
    --enable-soap \
    --enable-sockets \
    --enable-intl \
    --enable-pcntl \
    --with-zip \
    --with-pcre-jit \
    --with-bz2 \
    --with-config-file-path="$PREFIX/etc" \
    --with-config-file-scan-dir="$PREFIX/etc/conf.d" \
    --with-curl=/usr \
    --with-freetype=/usr \
    --enable-gd \
    --with-jpeg \
    --with-png \
    --with-zlib \
    --with-gettext \
    --with-gmp \
    --with-mysqli \
    --with-openssl \
    --with-pdo-mysql \
    --with-pdo-pgsql \
    --with-readline \
    --with-tidy \
    --with-xmlrpc
make -j4
sudo make install

sudo cp "$SRCPATH/php.ini-development" "$PREFIX/etc/php.ini"
sudo cp "$PREFIX/etc/php-fpm.conf.default" "$PREFIX/etc/php-fpm.conf"
sudo cp "$PREFIX/etc/php-fpm.d/www.conf.default" "$PREFIX/etc/php-fpm.d/www.conf"
sudo cp "$SRCPATH/sapi/fpm/php-fpm.service" "/etc/systemd/system/php-fpm.service"
