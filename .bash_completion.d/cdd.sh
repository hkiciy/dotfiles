#!/bin/bash
# shellcheck disable=SC2207

# usage:
#   cdd {category} {directory}

cdd() {
    local targetPath

    case "$1" in
        "source")
            targetPath="$HOME/source/$2"
            ;;
        "projects")
            targetPath="$HOME/source/projects/$2"
            ;;
        "vim")
            case "$2" in
                "main")
                    targetPath='/usr/local/src/vim/src'
                    ;;
                "dev")
                    targetPath='/usr/local/src/vimdev/src'
                    ;;
            esac
            ;;
        *)
            return
            ;;
    esac

    cd "$targetPath" || return
}

_compfunc_cdd() {
    local items

    case "${COMP_WORDS[COMP_CWORD-1]}" in
        "source")
            items=$(ls -1 -F ~/source/)
            ;;
        "projects")
            items=$(ls -1 -F ~/source/projects/)
            ;;
        "vim")
            items='main dev'
            ;;
        *)
            items='source projects vim'
            ;;
    esac

    COMPREPLY=($(compgen -W "$items" -- "${COMP_WORDS[COMP_CWORD]}"))
}

complete -F _compfunc_cdd cdd
