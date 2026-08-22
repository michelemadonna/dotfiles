#!/usr/bin/env zsh

if (( ! $+commands[oh-my-posh] )); then
    echo "oh-my-posh not found. Please refer to $DOTFILES_DIR/Readme.md for installation instructions."
    return
fi
export ZQS_PROMPT="ohmyposh"
