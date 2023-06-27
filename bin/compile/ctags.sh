#!/bin/bash

# Usage:
#   bash ctags.sh


readonly GITURL='https://github.com/universal-ctags/ctags.git'
readonly SRCPATH="/usr/local/src/ctags/"
readonly PREFIX="/opt/ctags"

if [ -d "$SRCPATH" ]; then
    echo "Remove $SRCPATH"
    rm -rf "$SRCPATH"
fi
git clone --depth 1 "$GITURL" "$SRCPATH"

cd "$SRCPATH" || exit

sh autogen.sh
./configure --prefix="$PREFIX"

make -j4
sudo make install
