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

if _has eza; then
    alias ls="eza --icons --git --group-directories-first"
    alias lls="eza -bghHliS@Z"
    alias ll="eza -las modified"
fi


#alias python=python3
# Use 256 color for tmux.
alias tmux="TERM=screen-256color-bce tmux"
# Attempt to take over existing sessions before creating a new tmux session.
TMUX_DEFAULT_SESSION="tmux"
alias t="tmux a -d -t ${TMUX_DEFAULT_SESSION} 2> /dev/null || tmux new -s ${TMUX_DEFAULT_SESSION}"

