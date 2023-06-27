#!/bin/bash

# Usage:
#   bash vim-for-python.sh

readonly SRCPATH='/usr/local/src/vim'
readonly PREFIX='/opt/python/3'

PATH="$PREFIX/bin:$PATH"

cd "$SRCPATH" || exit
s="$(git pull)"
if [ "$s" = 'Already up to date.' ]; then
    echo 'Already update vim.'
    exit
fi

sudo make uninstall
sudo make distclean
./configure \
    LDFLAGS="-export-dynamic -Wl,-rpath=$PREFIX/lib" \
    --disable-darwin \
    --disable-gpm \
    --disable-netbeans \
    --disable-selinux \
    --disable-sysmouse \
    --enable-fail-if-missing \
    --enable-gui=no \
    --enable-multibyte \
    --enable-python3interp=dynamic
make
sudo make install
