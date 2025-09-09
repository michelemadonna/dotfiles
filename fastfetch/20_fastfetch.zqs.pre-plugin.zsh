#!/usr/bin/env zsh
# this file is responsible for setting up fastfetch
local DOTFILES_DIR="${0:A:h:h}"

if [ $(uname -a | grep -ci Darwin) = 1 ]; then
    if ! command -v fastfetch &> /dev/null; then
        echo "Installing fastfetch with brew..."
        brew install fastfetch
    fi
else
    
    if ! command -v fastfetch &> /dev/null; then
        #if ubuntu < 25.01 or debian < 13
        if [ -f /etc/os-release ]; then
            . /etc/os-release
            if [[ "$ID" == "ubuntu" && "$(printf '%s\n' "25.01" "$VERSION_ID" | sort -V | head -n1)" != "25.01" ]] || \
               [[ "$ID" == "debian" && "$(printf '%s\n' "13" "$VERSION_ID" | sort -V | head -n1)" != "13" ]]; then
                echo "Install fastfetch with apt.."
                echo "sudo apt update"
                echo "sudo apt install -y fastfetch"
                return 0
            else
                echo "Your OS version do not have fastfetch in their repositories."
                echo "Install fastfetch with.."
                echo "sudo add-apt-repository ppa:fastfetch-cli/releases"
                echo "sudo apt update"
                echo "sudo apt install -y fastfetch"
                return 0
            fi
        fi
    fi
fi

#if exist the env ZQS_FASTFETCH_CONFIG and is not empty
if [ -n "$ZQS_FASTFETCH_CONFIG" ]; then
  alias fastfetch='fastfetch --config "$ZQS_FASTFETCH_CONFIG"'
else
  alias fastfetch='fastfetch --config "$DOTFILES_DIR/fastfetch/config.jsonc"'
fi




