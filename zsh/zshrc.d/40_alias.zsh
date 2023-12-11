#!/usr/bin/env zsh

#on mac you have to delete rm -Rf /usr/local/Cellar/git/*.*.*/share/zsh for git completions
#if [[ "$(uname -s)" == "Linux" ]]; then
#  FORGIT_COPY_CMD='xclip -selection clipboard'
#fi

alias alt2dig="dog"
alias alt2ping="gping"
alias althex="hexyl"
alias altcurl="http"
alias altps="procs"
alias althtop="gtop"
alias ls="exa --icons --git --group-directories-first"
alias ll="${aliases[ls]:-ls} -lar"
export PATH="$PATH:$FORGIT_INSTALL_DIR/bin"
