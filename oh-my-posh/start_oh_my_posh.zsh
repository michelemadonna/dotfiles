#!/usr/bin/env zsh
# this file is responsible for setting up oh-my-posh
if ! command -v oh-my-posh &> /dev/null; then
    echo "oh-my-posh not found. Please refer to $DOTFILES_DIR/Readme.md for installation instructions."
    exit 1
else

    if [ -f "$DOTFILES_DIR/oh-my-posh/omp.local.zsh" ]; then
        source "$DOTFILES_DIR/oh-my-posh/omp.local.zsh"
    fi

    #se esiste la variabile ZQS_OH_MY_POSH_CONFIG ed è valorizzata
    if [ -n "$ZQS_OH_MY_POSH_CONFIG" ]; then
        eval "$(oh-my-posh init zsh --config $ZQS_OH_MY_POSH_CONFIG)"
    else
        eval "$(oh-my-posh init zsh)"
    fi
fi


