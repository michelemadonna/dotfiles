#!/usr/bin/env zsh
# this file is responsible for setting up my zqs optionated env
if [[ ! -n "$DOTFILES_DIR" ]]; then
  export DOTFILES_DIR="${0:A:h:h:h}"
fi
FILENAME="${0:a}"
echo "$FILENAME"
if [ $(echo $FILENAME | grep -ci plugin) = 1 ]; then
    echo "sto in plugin"
    ln -sfn "$FILENAME" "$HOME/.zshrc.d/000000_temp.zsh"
    return
else
    echo "non sto in plugin!!!!"
    rm -f "$HOME/.zshrc.d/000000_temp.zsh"
fi

if [[ -L "$HOME/.zshenv" || -f "$HOME/.zshenv" ]]; then
    source "$HOME/.zshenv" 
fi

_has() {
  return $(whence $1 >/dev/null)
}

if [[ -z "$TMUX" ]]; then # Switch to xterm if we're in a tmux session.
  TERM="xterm-256color"
fi

if [ -z $TERM_PROGRAM ]; then # Set TERM_PROGRAM if not already set
  export TERM_PROGRAM=xterm	
fi

# Use 256 color for tmux.
alias tmux="TERM=screen-256color-bce tmux"
# Attempt to take over existing sessions before creating a new tmux session.
TMUX_DEFAULT_SESSION="tmux"
alias t="tmux a -d -t ${TMUX_DEFAULT_SESSION} 2> /dev/null || tmux new -s ${TMUX_DEFAULT_SESSION}"


if _has rg; then 
  export RIPGREP_CONFIG_PATH="$HOME/.ripgreprc"
fi

if _has bat; then
  # Export theme for http://github.com/sharkdp/bat.
  export BAT_THEME="Solarized (dark)"
fi

export EZA_COLORS="da=1;36;0"

export LS_COLORS='di=1;34;0:ln=2;2:so=32;40:pi=33;40:ex=31;40:bd=34;46:cd=34;43:su=0;41:sg=0;46:tw=0;42:ow=0;43:'
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*:descriptions' format '[%d]' # Set description format for completion
zstyle ':completion:*:*:docker:*' option-stacking yes
zstyle ':completion:*:*:docker-*:*' option-stacking yes
zstyle ':completion:*:git-checkout:*' sort false


alias _dig="dogggo"
alias _ping="gping"
alias _hex="hexyl"
alias _curl="http"
alias _ps="procs"
alias _top="btop"
alias _ls="command ls"

alias nodejs="command node"
echo "sssss"
if _has eza; then
    echo "cccccc"
    unalias ls
    alias ls="eza"
    alias ls="${aliases[ls]:-ls} --icons --git --group --time-style=long-iso --group-directories-first --color-scale"
    alias lls="${aliases[ls]:-ls} -bghHliS@Z --time-style=long-iso"
    alias ll="${aliases[ls]:-ls} --group --time-style=long-iso -las modified"
fi

