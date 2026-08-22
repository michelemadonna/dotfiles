#!/usr/bin/env zsh
# Preserve the installer-provided bindings while keeping their initialization
# at the single Quickstart-owned ~/.fzf.zsh load point.

if [[ -r "$HOME/.fzf/shell/key-bindings.zsh" ]]; then
  source "$HOME/.fzf/shell/key-bindings.zsh"
elif [[ -r /usr/share/doc/fzf/examples/key-bindings.zsh ]]; then
  source /usr/share/doc/fzf/examples/key-bindings.zsh
elif (( $+commands[fzf] )); then
  eval "$(command fzf --zsh 2>/dev/null)"
fi
