#!/usr/bin/env zsh

#export PATH="$PATH:$FORGIT_INSTALL_DIR/bin"
#if [[ "$(uname -s)" == "Linux" ]]; then
#  FORGIT_COPY_CMD='xclip -selection clipboard'
#fi




alias _dig="dog"
alias _ping="gping"
alias _hex="hexyl"
alias _curl="http"
alias _ps="procs"
alias _top="gtop"
alias ls="eza --icons --git --group-directories-first"
alias lls="${aliases[ls]:-ls} -bghHliS@Z"
alias ll="${aliases[ls]:-ls} -las modified"



# Use 256 color for tmux.
alias tmux="TERM=screen-256color-bce tmux"
# Attempt to take over existing sessions before creating a new tmux session.
TMUX_DEFAULT_SESSION="tmux"
alias t="tmux a -d -t ${TMUX_DEFAULT_SESSION} 2> /dev/null || tmux new -s ${TMUX_DEFAULT_SESSION}"

