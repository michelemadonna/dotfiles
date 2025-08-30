#!/usr/bin/env zsh
local DOTFILES_DIR="${0:A:h:h}"

#verifica se esiste il comando oh-my-posh. se non esiste esci e dai un messaggio in inglese suggerendo di usare $DOTFILES_DIR/Readme.md
if ! command -v oh-my-posh &> /dev/null; then
    echo "oh-my-posh not found. Please refer to $DOTFILES_DIR/Readme.md for installation instructions."
    exit 1
else
    #se esiste il file omp.local.zsh
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


