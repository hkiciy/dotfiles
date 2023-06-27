#!/bin/bash

# Usage:
#   bash cpython.sh {TAG}


readonly GITURL='https://github.com/python/cpython.git'
readonly SRCPATH='/usr/local/src/cpython'
readonly PREFIX='/opt/python/3'
readonly TAG="$1"

if [ -z "$TAG" ]; then
    echo 'Argument {TAG} is empty.'
    exit
fi

if [ -d "$SRCPATH" ]; then
    echo "Remove $SRCPATH"
    sudo rm -rf "$SRCPATH"

    echo "Remove $PREFIX"
    sudo rm -rf "$PREFIX"
fi

git clone --depth 1 -b "$TAG" "$GITURL" "$SRCPATH"
cd "$SRCPATH" || exit

./configure \
    CPPFLAGS=-I/usr/include/ncursesw \
    --prefix="$PREFIX" \
    --enable-optimizations

make -j4
sudo make install
