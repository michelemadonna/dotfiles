#!/usr/bin/env zsh

if [[ "$(uname)" == "Darwin" ]]; then
  clear_macos_icon_cache() {

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

