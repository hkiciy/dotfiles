#!/bin/bash

# Usage:
#   bash mozjpeg.sh

readonly SRCPATH='/usr/local/src/mozjpeg'
readonly PREFIX='/opt/mozjpeg'
readonly GITURL='https://github.com/mozilla/mozjpeg.git'

if [ -d "$SRCPATH" ]; then
    echo "Remove $SRCPATH"
    sudo rm -rf "$SRCPATH"
fi
git clone --depth 1 "$GITURL" "$SRCPATH"
cd "$SRCPATH" || exit

sudo make uninstall
sudo make distclean
autoreconf -fiv
./configure --prefix="$PREFIX"
make
sudo make install

