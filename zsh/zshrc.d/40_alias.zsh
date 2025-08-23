#!/usr/bin/env zsh
#This file is sourced by zshrc to set up aliases


#export PATH="$PATH:$FORGIT_INSTALL_DIR/bin"
#if [[ "$(uname -s)" == "Linux" ]]; then
#  FORGIT_COPY_CMD='xclip -selection clipboard'
#fi




alias _dig="dogggo"
alias _ping="gping"
alias _hex="hexyl"
alias _curl="http"
alias _ps="procs"
alias _top="btop"
alias _ls="command ls"

if _has eza; then
    unalias ls
    alias ls="eza"
    alias ls="${aliases[ls]:-ls} --icons --git --group --time-style=long-iso --group-directories-first --color-scale"
    alias lls="${aliases[ls]:-ls} -bghHliS@Z --time-style=long-iso"
    alias ll="${aliases[ls]:-ls} --group --time-style=long-iso -las modified"
fi


#alias python=python3
# Use 256 color for tmux.
alias tmux="TERM=screen-256color-bce tmux"
# Attempt to take over existing sessions before creating a new tmux session.
TMUX_DEFAULT_SESSION="tmux"
alias t="tmux a -d -t ${TMUX_DEFAULT_SESSION} 2> /dev/null || tmux new -s ${TMUX_DEFAULT_SESSION}"

