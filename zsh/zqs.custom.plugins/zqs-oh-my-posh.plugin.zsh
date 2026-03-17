#!/usr/bin/env zsh

if [[ ! -n "$DOTFILES_DIR" ]]; then
  export DOTFILES_DIR="${0:A:h:h:h}"
fi

if ! command -v oh-my-posh &> /dev/null; then
    echo "oh-my-posh not found. Please refer to $DOTFILES_DIR/Readme.md for installation instructions."
    return
fi

TARGET_FILE="$HOME/.p10k.zsh"

if [[ "$OSTYPE" == darwin* ]]; then
    SED_INPLACE=(-i '')
else
    SED_INPLACE=(-i)
fi


if ! head -n 1 "$TARGET_FILE" | grep -q "ohmyposh"; then
  sed "${SED_INPLACE[@]}" '1i\
if [[ "${ZQS_PROMPT}" == "ohmyposh" ]]; then\
  # this file is responsible for setting up oh-my-posh\
  if [ ! -n "$ZQS_OH_MY_POSH_CONFIG" ]; then\
    export ZQS_OH_MY_POSH_CONFIG="$DOTFILES_DIR/local/oh-my-posh/custom.omp.json"\
  fi\
  
  eval "$(oh-my-posh init zsh --config $ZQS_OH_MY_POSH_CONFIG)"\
  
  return\
fi
' "$TARGET_FILE"
fi


export ZQS_PROMPT="ohmyposh"



