#!/usr/bin/env zsh

#export JAVA_HOME=$(/usr/libexec/java_home)


_has() {
  return $(whence $1 >/dev/null)
}


# Use 256 color for tmux.
alias tmux="TERM=screen-256color-bce tmux"
# Attempt to take over existing sessions before creating a new tmux session.
TMUX_DEFAULT_SESSION="tmux"
alias t="tmux a -d -t ${TMUX_DEFAULT_SESSION} 2> /dev/null || tmux new -s ${TMUX_DEFAULT_SESSION}"
if [[ -z "$TMUX" ]]; then
  # Switch to xterm if we're in a tmux session.
  TERM="xterm-256color"
fi

if [ -z $TERM_PROGRAM ]; then
  export TERM_PROGRAM=xterm	
fi

if [[ -z "${INTELLIJ_ENVIRONMENT_READER}" ]]; then
    if [ $TERM_PROGRAM != "Apple_Terminal" ]; then
      neofetch
    fi
fi


if _has rg; then
  export RIPGREP_CONFIG_PATH="$HOME/.ripgreprc"
fi

if _has bat; then
  # Export theme for http://github.com/sharkdp/bat.
  export BAT_THEME="Solarized (dark)"
fi


export LS_COLORS='di=1;34;0:ln=2;2:so=32;40:pi=33;40:ex=31;40:bd=34;46:cd=34;43:su=0;41:sg=0;46:tw=0;42:ow=0;43:'
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
