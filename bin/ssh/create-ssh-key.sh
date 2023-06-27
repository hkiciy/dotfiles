#!/bin/bash

# usage:
#   bash create-ssh-key.sh {name}

readonly rootdir="$HOME/.ssh"

echo -n 'Input base directory name:'
read -r dir

if [ -d "$dir" ]; then
    echo 'Allready exitst.'
    exit 1
fi

mkdir -p "$rootdir/$dir"

echo -n 'Input email:'
read -r email

if ! ps -p "$SSH_AGENT_PID" > /dev/null
then
    eval "$(ssh-agent -s)"
fi
ssh-keygen -t ed25519 -C \""$email"\"
ssh-add "$HOME/.ssh/${dir}/id_ed25519"
