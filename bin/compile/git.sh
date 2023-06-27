#!/bin/bash

# Usage:
#   bash git.sh {TAG}

readonly SRCPATH='/usr/local/src/git'
readonly PREFIX='/opt/git'
readonly GITURL='https://github.com/git/git.git'
readonly TAG="$1"
readonly CONTRIBPATH="$PREFIX/contrib"
readonly SRCCONTRIBPATH="$SRCPATH/contrib"

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

sudo make distclean
make configure
./configure --prefix="$PREFIX"
make -j4
if [ -d "$PREFIX" ]; then
    echo "Remove $PREFIX"
    sudo rm -rf "$PREFIX"
fi
sudo make install

# Create contrib directory
sudo mkdir "$CONTRIBPATH"

# Install diff-highlight
echo 'Install diff-highlight'
cd "$SRCCONTRIBPATH/diff-highlight" || exit
make
cd "$SRCCONTRIBPATH" || exit
sudo cp -R diff-highlight "$CONTRIBPATH"

# Install completion
echo 'Install completion'
sudo cp -R completion "$CONTRIBPATH"
