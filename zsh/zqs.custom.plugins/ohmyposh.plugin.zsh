#!/usr/bin/env zsh
# this file is responsible for setting up oh-my-posh
if [[ ! -n "$DOTFILES_DIR" ]]; then
  export DOTFILES_DIR="${0:A:h:h:h}"
fi


if [ $(uname -a | grep -ci Linux) = 1 ]; then
    export PATH="$PATH:$HOME/.local/bin/"
fi

if [[ ! -L "$HOME/.p10k.zsh" ]] || [[ -L "$HOME/.p10k.zsh" && ! $(head -n 2 "$HOME/.p10k.zsh" | grep -q "oh-my-posh") ]]; then
    ln -sfn "$DOTFILES_DIR/oh-my-posh/start_oh_my_posh.zsh" "$HOME/.p10k.zsh"
fi

export ZQS_USE_OH_MY_POSH="true"
