#!/usr/bin/env zsh

function allafine(){

    zle accept-line # Accept the current line
    tput cup 9999 0 # Move cursor to the bottom of the terminal
}
zle -N allafine # Define the allafine function for Zsh line editor
bindkey '^M' allafine # Bind Ctrl+M to the allafine function. Ctrl+M is often used as an alternative to Enter in some terminal applications.


if [[ "$(uname)" != "Darwin" ]]; then
  cleariconcache() {

    echo "🧹 Cleaning macOS icon cache..."
    sudo rm -rf /Library/Caches/com.apple.iconservices.store >/dev/null 2>&1
    sudo find /private/var/folders/ \( -name com.apple.dock.iconcache -or -name com.apple.iconservices \) -exec rm -rf {} \; >/dev/null 2>&1
    sleep 3
    sudo touch /Applications/* >/dev/null 2>&1
    killall Dock >/dev/null 2>&1
    killall Finder >/dev/null 2>&1
    echo "✅ Icon cache cleared!"
    echo "🔄 Dock and Finder restarted successfully."
  }
fi

