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
alias ls="eza --icons --git --group-directories-first"
alias ll="${aliases[ls]:-ls} -las modified"
export PATH="$PATH:$FORGIT_INSTALL_DIR/bin"


# Use 256 color for tmux.
alias tmux="TERM=screen-256color-bce tmux"
# Attempt to take over existing sessions before creating a new tmux session.
TMUX_DEFAULT_SESSION="tmux"
alias t="tmux a -d -t ${TMUX_DEFAULT_SESSION} 2> /dev/null || tmux new -s ${TMUX_DEFAULT_SESSION}"


#PROMPT=$PROMPT ${tput cup 9999 0}