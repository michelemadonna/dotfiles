#!/usr/bin/env zsh

if [[ "$(uname)" != "Linux" ]]; then
  function clear_macos_icon_cache() {

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

# Rebuild zgenom's generated init and all Zsh completion/activation caches.
function zqs-reset-zsh-cache() {
  emulate -L zsh

  if (( ! $+functions[zgenom] && ! $+commands[zgenom] )); then
    print -u2 -r -- "zgenom is not available in this shell"
    return 1
  fi

  zgenom reset || return

  local -a cache_files
  cache_files=(
    "$HOME"/.zcompdump*(N)
    "$HOME"/.zgenom/zcompdump_*(N)
    "$HOME"/.cache/oh-my-zsh/completions/*(N)
    "$HOME"/.cache/zsh/mise-activate*.zsh(N)
  )

  (( ${#cache_files} )) && command rm -f -- "${cache_files[@]}"
  command touch "$HOME/.zsh-quickstart-local-plugins" || return

  print -r -- "Zsh caches cleared; rebuilding configuration..."
  exec zsh
}
