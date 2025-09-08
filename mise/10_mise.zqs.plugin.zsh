#!/usr/bin/env zsh
# this file is responsible for setting up oh-my-posh
local DOTFILES_DIR="${0:A:h:h}"

if [ $(uname -a | grep -ci Darwin) = 1 ]; then
    if ! command -v mise &> /dev/null; then
        echo "Installing mise with brew..."
        brew install mise
    fi
else
    export PATH="$PATH:$HOME/.local/bin/"
    if ! command -v mise &> /dev/null; then
        if [ ! -f "$HOME/.local/bin/mise" ]; then
            mkdir -p $HOME/.local/bin
            curl https://mise.run | sh
        fi
    fi
fi

#this is needed by powerlevel10k to show the mise segment using asdf segment configuration
export ASDF_DATA_DIR="${XDG_DATA_HOME:-$HOME/.local/share}/asdf"

if [[ ! -d "$ASDF_DATA_DIR" ]]; then
  mkdir -p "$ASDF_DATA_DIR"
  git clone https://github.com/asdf-vm/asdf-plugins.git "$ASDF_DATA_DIR"

  for file in "$ASDF_DATA_DIR/plugins"/*; do
    local dir_name="${file##*/}"
    rm "$file"
    mkdir -p "$ASDF_DATA_DIR/plugins/$dir_name"
  done
fi

asdf() {
  command mise "$@"
}

