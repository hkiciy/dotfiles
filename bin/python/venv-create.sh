#!/bin/bash

# Usage:
#   bash venv-create.sh {env}

readonly virtualdir=/opt/python-virtual/
readonly cmd=/opt/python/3/bin/python3

if [ ! 1 -eq $# ]; then
    echo 'error: Specify a name for your virtual environment.'
    exit 1
fi

if [ -d "${virtualdir}/${1}" ]; then
    echo 'error: That virtual environment name already exists.'
    exit 1
fi

"${cmd}" -m venv "${virtualdir}/${1}"
