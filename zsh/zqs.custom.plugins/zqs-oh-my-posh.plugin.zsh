#!/usr/bin/env zsh
echo "loaded oh-my-posh"
if [[ ! -n "$DOTFILES_DIR" ]]; then
  export DOTFILES_DIR="${0:A:h:h:h}"
fi

if ! command -v oh-my-posh &> /dev/null; then
    echo "oh-my-posh not found. Please refer to $DOTFILES_DIR/Readme.md for installation instructions."
    return
fi

TARGET_FILE="$DOTFILES_DIR/local/home/.p10k.zsh"

if [[ "$OSTYPE" == darwin* ]]; then
    SED_INPLACE=(-i '')
else
    SED_INPLACE=(-i)
fi


if ! head -n 1 "$TARGET_FILE" | grep -q "ohmyposh"; then
    sed $SED_INPLACE '1i\
if [[ "${ZQS_PROMPT}" == "ohmyposh" ]]; then\
  # this file is responsible for setting up oh-my-posh\
  if [ -n "$ZQS_OH_MY_POSH_CONFIG" ]; then\
      eval "$(oh-my-posh init zsh --config $ZQS_OH_MY_POSH_CONFIG)"\
  else\
      eval "$(oh-my-posh init zsh --config $DOTFILES_DIR/local/oh-my-posh/custom.omp.json)"\
  fi\
  return\
fi\
' "$TARGET_FILE"


fi

if [[ ! -n "$ZQS_PROMPT" ]]; then
  export ZQS_PROMPT="ohmyposh"
  
fi


