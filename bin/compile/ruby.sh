#!/bin/bash

# Usage:
#   bash ruby.sh {TAG}

readonly SRCPATH='/usr/local/src/ruby'
readonly PREFIX='/opt/ruby'
readonly GITURL='https://github.com/ruby/ruby.git'
readonly TAG="$1"

if [ -z "$TAG" ]; then
    echo 'Argument {TAG} is empty.'
    exit
fi

if [ -d "$SRCPATH" ]; then
    echo "Remove $SRCPATH"
    sudo rm -rf "$SRCPATH"
fi
git clone --depth 1 -b "$TAG" "$GITURL" "$SRCPATH"
cd "$SRCPATH" || exit

autoconf
./configure \
    --disable-install-doc \
    --disable-install-rdoc \
    --disable-install-capi \
    --prefix="$PREFIX"
make
if [ -d "$PREFIX" ]; then
    echo "Remove $PREFIX"
    sudo rm -rf "$PREFIX"
fi
sudo make install
