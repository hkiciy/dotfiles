# Terminal
export EDITOR=vim

# tmux
export PATH="/opt/tmux/bin:$PATH"
# Snap
export PATH="/snap/bin:$PATH"
# Ctags
export PATH="/opt/ctags/bin:$PATH"
# Flutter
export PATH="$HOME/local/src/flutter/bin:$PATH"
# PHP
export PATH="/opt/php/bin/:$PATH"
export PATH="$HOME/.config/composer/vendor/bin:$PATH"
# Node.js
export PATH="$HOME/.npm/bin/:$PATH"
eval "$(npm completion)"
# Deno
export PATH="$HOME/.deno/bin:$PATH"
# Rust
export PATH="$HOME/.cargo/bin:$PATH"
# Golang
export GOROOT=/snap/go/current/
export GOPATH="$HOME/source/golang"
# export PATH=$GOROOT/bin:$GOPATH/bin:$PATH
# Android
#export PATH="$HOME/Android/Sdk/platform-tools/:$PATH"
# Git
if [[ "$(uname -r)" = *microsoft* ]]; then
    export PATH=/usr/share/doc/git/contrib/diff-highlight:$PATH
elif [[ "$(uname)" = 'Linux' ]]; then
    export PATH=/opt/git/bin:/opt/git/contrib/diff-highlight:$PATH
    #shellcheck source=/dev/null
    source /opt/git/contrib/completion/git-completion.bash
fi


# aliases
alias clearh='echo -e "\e[0m" && history -c && clear'
alias restartshell='echo -e "\e[0m" && exec $SHELL -l'
alias shutdownfast='sleep 3 && /usr/bin/xfce4-session-logout --halt --fast'
alias tree='tree -a -I "node_modules|.git|__pycache__"'
alias grep='grep --color=auto --binary-files=without-match'
alias ls='ls --color=auto -v -A --human-readable --group-directories-first'
alias lsh='/bin/ls -l --color=auto -v -A --human-readable --group-directories-first --time-style="+%Y-%m-%d %H:%M:%S"'
alias lsl='/bin/ls -l --color=auto -v -A --group-directories-first --time-style="+%Y-%m-%d %H:%M:%S"'
alias composer='php ~/bin/composer.phar'
alias check-smartctl='sudo smartctl -i /dev/nvme0 -a'
alias dcd='docker compose down'
alias dcu='docker compose up -d'
alias dce='docker compose exec'
alias dcl='docker compose logs'
alias dcp='docker compose ps'
alias sail='./vendor/bin/sail'
alias py.main='source /opt/python-virtual/main/bin/activate'
#alias tmuxsr-save='bash ~/source/projects/tmuxsr/save.sh'
#alias tmuxsr-restore='bash ~/source/projects/tmuxsr/restore.sh'
#alias gdbv='gdb -p $(pgrep -n vim)'
#alias exim4-queue-all-clear='sudo sh -c "exim -bp | exiqgrep -i | xargs exim -Mrm"'
#alias exim4-show-queue='sudo exim -bp'

for file in ~/.bash_completion.d/* ; do
    # shellcheck source=/dev/null
    . "$file"
done
