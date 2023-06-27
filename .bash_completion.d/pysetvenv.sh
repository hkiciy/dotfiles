#!/bin/bash
# shellcheck disable=SC2207

# usage:
#   pysetvenv {env}

pysetvenv() {
    #shellcheck source=/dev/null
    . /opt/python-virtual/"$1"/bin/activate
}

__compfunc_pysetvenv() {
    local items
    local cur

    items=$(ls -1 /opt/python-virtual/)
    cur="${COMP_WORDS[COMP_CWORD]}"

    COMPREPLY=($(compgen -W "$items" -- "$cur"))
}

complete -F __compfunc_pysetvenv pysetvenv
