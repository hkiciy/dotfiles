#!/bin/bash

# Usage:
#   bash vimdev.sh {FEATURES} {GUI}

readonly SRCPATH='/usr/local/src/vimdev'
readonly PREFIX='/opt/vimdev'

case "$1" in
    t) readonly FEATURES="tiny" ;;
    s) readonly FEATURES="small" ;;
    n) readonly FEATURES="normal" ;;
    b) readonly FEATURES="big" ;;
    h) readonly FEATURES="huge" ;;
    *) echo 'error: Invalid FEATURES.'
        exit 1
esac

case "$2" in
    g) readonly GUI='gtk3' ;;
    *) readonly GUI='no' ;;
esac

cd "$SRCPATH" || exit 1

compile(){
    sudo make distclean
    ./configure \
        CFLAGS='-ggdb3' \
        --prefix="$PREFIX" \
        --with-features="$FEATURES" \
        --enable-gui="$GUI" \
        --enable-fail-if-missing
    make
    sudo rm -rf "$PREFIX"
    sudo make install
    cd src/ || exit 1
    ctags -R
}

time compile
