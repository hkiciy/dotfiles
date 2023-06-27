autoload -Uz colors
colors

autoload -U compinit
compinit

PROMPT="%{$fg_bold[green]%n@%m(zsh)%}%{$reset_color%}:%{$fg_bold[blue]%~%}%{$reset_color%}$ "

case ${OSTYPE} in
    darwin*)
        export PATH="/opt/homebrew/bin:$PATH"
        export PATH="/opt/homebrew/share/git-core/contrib/diff-highlight:$PATH"
        alias ls='ls -G -v -A -h'
        alias ctags="`brew --prefix`/bin/ctags"
        ;;
    linux*)
        ;;
esac
