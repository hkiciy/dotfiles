#!/bin/bash
# shellcheck disable=SC2207

# usage:
#   tmux {command}

__compfunc_tmux() {
    local items
    local cur
    local cword
    local prev

    items="$(tmux list-commands | cut -d' ' -f1)"
    cur="${COMP_WORDS[COMP_CWORD]}"
    cword=$COMP_CWORD
    prev="${COMP_WORDS[COMP_CWORD-1]}"

    if [[ $cword -eq 1 || "$prev" = '\;' ]]; then
        COMPREPLY=($(compgen -W "$items" -- "$cur"))
    fi
}

complete -F __compfunc_tmux tmux
