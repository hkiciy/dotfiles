#!/bin/bash

ln -s ~/dotfiles/.bash_aliases ~/
ln -s ~/dotfiles/.gitconfig ~/
ln -s ~/dotfiles/.ideavimrc ~/
ln -s ~/dotfiles/.inputrc ~/
ln -s ~/dotfiles/.npmrc ~/
ln -s ~/dotfiles/.tmux.conf ~/
ln -s ~/dotfiles/.zshrc ~/

ln -s ~/dotfiles/.bash_completion.d/ ~/
ln -s ~/dotfiles/.vim/ ~/
ln -s ~/dotfiles/bin/ ~/

if [[ "$(uname -r)" == *microsoft* ]]; then
    sudo chmod +x /usr/share/doc/git/contrib/diff-highlight/diff-highlight
    sudo ln -s /usr/share/doc/git/contrib/diff-highlight/diff-highlight /usr/local/bin/diff-highlight
fi
