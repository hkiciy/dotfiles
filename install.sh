#!/bin/bash

# Locale
sudo dpkg-reconfigure locales
LANG=C xdg-user-dirs-update --force
rm -rf ~/ダウンロード/ ~/テンプレート/ ~/デスクトップ/ ~/ドキュメント/ ~/ビデオ/ ~/公開/ ~/画像/ ~/音楽/
sudo dpkg-reconfigure keyboard-configuration

# Set source
. /etc/os-release;
codename="deb http://ftp.jp.debian.org/debian/ $VERSION_CODENAME-backports main"
echo "$codename" | sudo tee /etc/apt/sources.list.d/backports.list > /dev/null
sudo apt update

# Setting Japanese
sudo apt install -y fonts-noto-cjk fcitx5-mozc zenity

# Tools
sudo apt install -y curl devhelp inotify-tools snapd \
    tre-agrep tree universal-ctags xclip xdotool webp-pixbuf-loader
sudo snap install keepassxc scrcpy shellcheck software-properties-common

# Mail
sudo apt install -y mailutils mutt

# PC, NAS, Security
sudo apt install -y firewalld smartmontools gvfs-backends

# Develop
sudo apt install -y autoconf bison build-essential libbz2-dev libcurl4-openssl-dev \
    libgmp-dev libjpeg-dev libncurses5-dev libncursesw5-dev libonig-dev libpng-dev \
    libpq-dev libreadline-dev libsqlite3-dev libssl-dev libtidy-dev libxml2-dev \
    libzip-dev re2c tcl-dev tk-dev
sudo apt build-dep git tmux vim

echo 'finish: Delete old desktop directory after reboot.'
