#!/bin/bash

# Usage:
#   bash tmux.sh

readonly GITURL='https://github.com/tmux/tmux.git'
readonly SRCPATH='/usr/local/src/tmux'
readonly PREFIX='/opt/tmux'

if [ -d "$SRCPATH" ]; then
    echo "Remove $SRCPATH"
    sudo rm -rf "$SRCPATH"
fi

if [ -d "$PREFIX" ]; then
    echo "Remove $PREFIX"
    sudo rm -rf "$PREFIX"
fi

git clone --depth 1 "$GITURL" "$SRCPATH"
cd "$SRCPATH" || exit 1

sh autogen.sh
./configure --prefix="$PREFIX"
make -j4
sudo make install
