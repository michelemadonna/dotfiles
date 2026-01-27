#!/usr/bin/env zsh
# this file is responsible for setting up my zqs optionated env

_has() {
  return $(whence $1 >/dev/null)
}

if [[ ! -n "$DOTFILES_DIR" ]]; then
  export DOTFILES_DIR="${0:A:h:h:h}"
fi

FILENAME="${0:a}"
if [ $(echo $FILENAME | grep -ci plugin) = 1 ]; then
    ln -sfn "$FILENAME" "$HOME/.zshrc.d/000000_temp.zsh"
    return
else
    rm -f "$HOME/.zshrc.d/000000_temp.zsh"
fi

if [[ -L "$HOME/.zshenv" || -f "$HOME/.zshenv" ]]; then
    source "$HOME/.zshenv" 
fi

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

if _has eza; then
    unalias ls
    alias ls="eza"
    alias ls="${aliases[ls]:-ls} --icons --git --group --time-style=long-iso --group-directories-first --color-scale"
    alias lls="${aliases[ls]:-ls} -bghHliS@Z --time-style=long-iso"
    alias ll="${aliases[ls]:-ls} --group --time-style=long-iso -las modified"
fi

# this file is sourced by zshrc to set up allafine integration.
# it moves the cursor to the bottom of the terminal when pressing Enter.
if [[ "${ZQS_ENABLE_ALLAFINE}" == "true" ]]; then
  echo "Enabling allafine integration..."
  function allafine(){

      zle accept-line # Accept the current line
      tput cup 9999 0 # Move cursor to the bottom of the terminal
  }
  zle -N allafine # Define the allafine function for Zsh line editor
  bindkey '^M' allafine # Bind Ctrl+M to the allafine function. Ctrl+M is often used as an alternative to Enter in some terminal applications.

  if whence -w _fzf-tab-apply >/dev/null; then
    _orig_fzf_tab_apply=${functions[_fzf-tab-apply]}
    _fzf-tab-apply() {
      # --- PRE-HOOK: delete previous prompt line(s) ---
      local lines
      lines=$(echo -n "$PS1" | wc -l)   # number of lines your PS1 takes
      print -n "\033[${lines}A\033[2K"   # move up and clear those lines
      # --- CALL original _fzf-tab-apply ---
      print -n "$(tput cup 9999 0)"
      eval "$_orig_fzf_tab_apply" "$@"
    }
  fi
fi