#!/bin/bash

# Usage:
#   bash vim.sh

readonly GITURL='https://github.com/vim/vim.git'
readonly SRCPATH="/usr/local/src/vim/"

if [ -d "$SRCPATH" ]; then
    cd "$SRCPATH" || exit 1
    s="$(git pull)"
    if [ "$s" = 'Already up to date.' ]; then
        echo 'This is the latest version.'
        exit 0
    fi
else
    git clone --depth 1 "$GITURL" "$SRCPATH"
    cd "$SRCPATH" || exit 1
fi

sudo make uninstall
sudo make distclean

./configure \
    --enable-gui=gtk3 \
    --enable-luainterp \
    --with-luajit \
    --with-features=huge \
    --enable-fail-if-missing

make -j4
sudo make install
