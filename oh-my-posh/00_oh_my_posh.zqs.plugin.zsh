#!/usr/bin/env zsh
# this file is responsible for setting up oh-my-posh
local DOTFILES_DIR="${0:A:h:h}"

if [ $(uname -a | grep -ci Darwin) = 1 ]; then
    if ! command -v oh-my-posh &> /dev/null; then
        echo "Installing oh-my-posh with brew..."
        brew install oh-my-posh
    fi
else
    export PATH="$PATH:$HOME/.local/bin/"
    if ! command -v oh-my-posh &> /dev/null; then
        if [ ! -f "$HOME/.local/bin/oh-my-posh" ]; then
            mkdir -p $HOME/.local/bin
            curl -s https://ohmyposh.dev/install.sh | bash -s -- -d $HOME/.local/bin
        fi
    fi
fi

if [[ ! -f "$HOME/.p10k.zsh" ]] || ! head -n 2 "$HOME/.p10k.zsh" | grep -q "oh-my-posh"; then
    cp -f "$DOTFILES_DIR/oh-my-posh/start_oh_my_posh.zsh" "$DOTFILES_DIR/zsh/zsh/.p10k.zsh"
    ln -sfn "$DOTFILES_DIR/zsh/zsh/.p10k.zsh" "$HOME/.p10k.zsh"
fi

export ZQS_USE_OH_MY_POSH="true"
