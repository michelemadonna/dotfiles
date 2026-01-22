#!/usr/bin/env zsh
# this file is responsible for setting up oh-my-posh
if [[ ! -n "$DOTFILES_DIR" ]]; then
  export DOTFILES_DIR="${0:A:h:h}"
fi

if ! command -v oh-my-posh &> /dev/null; then
    echo "oh-my-posh not found. Please refer to $DOTFILES_DIR/Readme.md for installation instructions."
    exit 1
else

    if [ -n "$ZQS_OH_MY_POSH_CONFIG" ]; then
        eval "$(oh-my-posh init zsh --config $ZQS_OH_MY_POSH_CONFIG)"
    else
        eval "$(oh-my-posh init zsh --config $DOTFILES_DIR/oh-my-posh/custom.omp.json)"
    fi
fi


