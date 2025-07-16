#!/usr/bin/env zsh
FD_HIDDEN_FLAG=""
EXA_HIDDEN_FLAG=""

export FZF_DEFAULT_COMMAND="fdx --type f --follow \$FD_HIDDEN_FLAG -E .git 2>/dev/null || find . -type f ! -path '*/.git/*'"
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_ALT_C_COMMAND="fdx --type d --color never \$FD_HIDDEN_FLAG -E .git 2>/dev/null || find . -type d ! -path '*/.git/*'"

export FZF_ALT_C_OPTS="--preview '(ezax \$EXA_HIDDEN_FLAG --icons --tree --color=always {} 2>/dev/null || tree -C {}) | head -200'"

export FZF_DEFAULT_OPTS="--multi \
  --bind ctrl-a:toggle-all,ctrl-space:toggle,alt-p:toggle-preview,alt-k:preview-up,alt-j:preview-down"

export FZF_CTRL_T_OPTS="--preview '(batx --style=numbers --color=always {} 2>/dev/null || cat {} 2>/dev/null) | head -200'"

zstyle ':fzf-tab:complete:cd:*' fzf-preview "(ezax \$EXA_HIDDEN_FLAG --icons --tree --color=always \$realpath 2>/dev/null || tree -C \$realpath 2>/dev/null) | head -200"
zstyle ':completion:*:descriptions' format '[%d]'
zstyle ':fzf-tab:*' switch-group ',' '.'
zstyle ':fzf-tab:*' use-fzf-default-opts yes

zstyle ':fzf-tab:complete:micro:*' fzf-preview "[[ -e \$realpath ]] \
  && (batx --style=numbers --color=always \"\$realpath\" 2>/dev/null || cat \"\$realpath\" 2>/dev/null) \
  || (ezax \$EXA_HIDDEN_FLAG --icons --tree --color=always \"\$realpath\" 2>/dev/null || tree -C \"\$realpath\" 2>/dev/null) | head -200"

function toggle_fzf_hidden() {
  if [[ "$FZF_DEFAULT_COMMAND" == *"--hidden"* ]]; then
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

  export FZF_DEFAULT_COMMAND="fdx --type f --follow \$FD_HIDDEN_FLAG -E .git 2>/dev/null || find . -type f ! -path '*/.git/*'"
  export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
  export FZF_ALT_C_COMMAND="fdx --type d --color never \$FD_HIDDEN_FLAG -E .git 2>/dev/null || find . -type d ! -path '*/.git/*'"
  export FZF_ALT_C_OPTS="--preview '(ezax \$EXA_HIDDEN_FLAG --icons --tree --color=always {} 2>/dev/null || tree -C {}) | head -200'"

  zstyle ':fzf-tab:complete:micro:*' fzf-preview "[[ -e \$realpath ]] \
    && (batx --style=numbers --color=always \"\$realpath\" 2>/dev/null || cat \"\$realpath\" 2>/dev/null) \
    || (ezax \$EXA_HIDDEN_FLAG --icons --tree --color=always \"\$realpath\" 2>/dev/null || tree -C \"\$realpath\" 2>/dev/null) | head -200"

  zstyle ':fzf-tab:complete:cd:*' fzf-preview "(ezax \$EXA_HIDDEN_FLAG --icons --tree --color=always \$realpath 2>/dev/null || tree -C \$realpath 2>/dev/null) | head -200"
}

bindkey -s '\eh' 'toggle_fzf_hidden\n'
