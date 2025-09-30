#!/usr/bin/env zsh

_has() {
  return $(whence $1 >/dev/null)
}

export DOTFILES_DIR="${0:A:h:h:h}"

tput cup 9999 0 # Move cursor to the bottom of the terminal

#show fastfetch when opening a new terminal, but not when opening an editor or IDE from the terminal
# Set up fastfetch to run only if the parent command is not an editor or IDE
# This prevents fastfetch from running in editors like VSCode, Neovim, etc.
if _has fastfetch && [[ "$ZQS_SHOW_FASTFETCH" == "true" ]]; then
  parent_cmd=$(ps -o comm= -p $(ps -o ppid= -p $$))
  if ! echo "$parent_cmd" | grep -qiE 'zed|code|micro|nvim|vim|idea|clion|goland|phpstorm|pycharm|tmux|Terminal'; then
    fastfetch --pipe false
  fi
fi

# load fzf-tab completion if fzf is installed
(( ! $+commands[fzf] )) && return
if whence -w __fzf_reload >/dev/null; then
  __fzf_reload
fi 