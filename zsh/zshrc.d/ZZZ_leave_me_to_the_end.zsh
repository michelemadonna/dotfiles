#!/usr/bin/env zsh

_has() {
  return $(whence $1 >/dev/null)
}

if [[ ! -n "$DOTFILES_DIR" ]]; then
  export DOTFILES_DIR="${0:A:h:h:h}"
fi


tput cup 9999 0 # Move cursor to the bottom of the terminal

if [[ "$ZQS_SHOW_FASTFETCH" == "true" ]]; then
  if command -v fastfetch &> /dev/null; then
    #if exist the env ZQS_FASTFETCH_CONFIG and is not empty
    if [ -n "$ZQS_FASTFETCH_CONFIG" ]; then
        alias fastfetch='fastfetch --config "$ZQS_FASTFETCH_CONFIG"'
    else
        alias fastfetch='fastfetch --config "$DOTFILES_DIR/fastfetch/config.jsonc"'
    fi

    #show fastfetch when opening a new terminal, but not when opening an editor or IDE from the terminal
    # Set up fastfetch to run only if the parent command is not an editor or IDE
    # This prevents fastfetch from running in editors like VSCode, Neovim, etc.
    parent_cmd=$(ps -o comm= -p $(ps -o ppid= -p $$))
    if ! echo "$parent_cmd" | grep -qiE 'zed|code|micro|nvim|vim|idea|clion|goland|phpstorm|pycharm|tmux|fresh|helix|Terminal'; then
      fastfetch --pipe false
    fi
  else
      echo "fastfetch not found. Please refer to $DOTFILES_DIR/Readme.md for installation instructions."
      exit 1
  fi
fi

# load fzf-tab completion if fzf is installed
(( ! $+commands[fzf] )) && return
if whence -w __fzf_reload >/dev/null; then
  __fzf_reload
fi 