#!/usr/bin/env zsh
#This file is sourced by zshrc to set up fzf integration.
if _has fzf; then
  # Set up fzf with hidden files toggle
  _apply_fzf_hidden_mode() {
    if [[ "$FD_HIDDEN_FLAG" == *"--hidden"*  || "$1" == "false" ]]; then
      unsetopt globdots
      FD_HIDDEN_FLAG=""
      EXA_HIDDEN_FLAG=""
      echo "🙉 Hidden files OFF"
    else
      setopt globdots
      FD_HIDDEN_FLAG="--hidden"
      EXA_HIDDEN_FLAG="--all"
      echo "🙈 Hidden files ON"
    fi
    # Set up fzf commands
    export FZF_DEFAULT_COMMAND="fd --type f --follow \$FD_HIDDEN_FLAG --exclude '.git' --exclude 'node_modules' 2>/dev/null || find . -type f ! -path '*/.git/*'"
    export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
    export FZF_ALT_C_COMMAND="fd --type d --color never \$FD_HIDDEN_FLAG --exclude '.git' --exclude 'node_modules' 2>/dev/null || find . -type d ! -path '*/.git/*'"
    export FZF_ALT_C_OPTS="--preview '(eza \$EXA_HIDDEN_FLAG --icons --tree --color=always {} 2>/dev/null || tree -C {}) | head -200'"
    export FZF_DEFAULT_OPTS="--multi \
      --bind ctrl-a:toggle-all,ctrl-space:toggle,alt-p:toggle-preview,alt-k:preview-up,alt-j:preview-down"

    export FZF_CTRL_T_OPTS="--preview '(bat --style=numbers --color=always {} 2>/dev/null || cat {} 2>/dev/null) | head -200'"
    # Set up fzf preview for various commands
    zstyle ":fzf-tab:complete:${${EDITOR}:t}:*" fzf-preview "[[ -e \$realpath ]] \
      && (bat --style=numbers --color=always \"\$realpath\" 2>/dev/null || cat \"\$realpath\" 2>/dev/null) \
      || (eza \$EXA_HIDDEN_FLAG --icons --tree --color=always \"\$realpath\" 2>/dev/null || tree -C \"\$realpath\" 2>/dev/null) | head -200"
    zstyle ':fzf-tab:complete:cd:*' fzf-preview "(eza \$EXA_HIDDEN_FLAG --icons --tree --color=always \$realpath 2>/dev/null || tree -C \$realpath 2>/dev/null) | head -200"
    zstyle ':fzf-tab:*' switch-group ',' '.'
    zstyle ':fzf-tab:*' use-fzf-default-opts yes
    #zle reset-prompt
  }

  bindkey -s '\eh' '_apply_fzf_hidden_mode\n' # Bind to Alt-h to toggle hidden files in fzf

  # Set up fzf hidden files toggle
  _apply_fzf_hidden_mode true > /dev/null
fi


