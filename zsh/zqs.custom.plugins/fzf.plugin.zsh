#!/usr/bin/env zsh
#This file is sourced by zshrc to set up fzf integration.
#includes private functions for toggling hidden files, setting default commands, and configuring fzf options.
(( ! $+commands[fzf] )) && return

__toggle_fzf_hidden_files() {
  local show_hidden="$1"
  if [[ -z "$show_hidden" ]]; then
    # Toggle mode
    if [[ -f ~/.fzf/.FZF_SHOW_HIDDEN ]]; then
      show_hidden="false"
    else
      show_hidden="true"
    fi
  fi
  if [[ "$show_hidden" == "true" ]]; then
    setopt globdots
    echo "🙈 FZF Hide Hidden files ON"
    touch ~/.fzf/.FZF_SHOW_HIDDEN
  else
    unsetopt globdots
    echo "🙉 FZF Show Hidden files OFF"
    rm -f ~/.fzf/.FZF_SHOW_HIDDEN
  fi
  __fzf_reload

  zle reset-prompt
}

  zle -N __toggle_fzf_hidden_files __toggle_fzf_hidden_files # Define the toggle_fzf_hidden_files function for Zsh line editor
  bindkey '^H' __toggle_fzf_hidden_files # Bind ctrl+h to toggle_fzf_hidden_files

  
__fzf_default_command() {
  if [[ -f ~/.fzf/.FZF_SHOW_HIDDEN ]]; then
    setopt globdots
    FD_HIDDEN_FLAG="--hidden"
    FIND_HIDDEN_EXPR="-name '.*' -prune -o"
  else
    unsetopt globdots
    FD_HIDDEN_FLAG=""
    FIND_HIDDEN_EXPR=""
  fi

  if command -v fd &>/dev/null; then
    echo "fd --type f --follow $FD_HIDDEN_FLAG --exclude '.git' --exclude 'node_modules' 2>/dev/null"
  else
    if [[ -n "$FIND_HIDDEN_EXPR" ]]; then
      echo "find . \( -path '*/.git/*' -o -path '*/node_modules/*' \) -prune -o -type f -print"
    else
      echo "find . -type f ! -path '*/.git/*' ! -path '*/node_modules/*' ! -name '.*'"
    fi
  fi
}

__fzf_alt_c_command() {
  if [[ -f ~/.fzf/.FZF_SHOW_HIDDEN ]]; then
    setopt globdots
    FD_HIDDEN_FLAG="--hidden"
    FIND_HIDDEN_EXPR=""
  else
    unsetopt globdots
    FD_HIDDEN_FLAG=""
    FIND_HIDDEN_EXPR="! -name '.*'"
  fi

  if command -v fd &>/dev/null; then
    echo "fd --type d --color never $FD_HIDDEN_FLAG --exclude '.git' --exclude 'node_modules' 2>/dev/null"
  else
    # Exclude .git and node_modules, and optionally hidden dirs
    echo "find . -type d ! -path '*/.git/*' ! -path '*/node_modules/*' $FIND_HIDDEN_EXPR"
  fi
}
  
__fzf_alt_c_opts() {
  if [[ -f ~/.fzf/.FZF_SHOW_HIDDEN ]]; then
    setopt globdots
    EXA_HIDDEN_FLAG="--all"
    LS_HIDDEN_FLAG="-A"
    TREE_HIDDEN_FLAG="-a"
  else
    unsetopt globdots
    EXA_HIDDEN_FLAG=""
    LS_HIDDEN_FLAG=""
    TREE_HIDDEN_FLAG=""
  fi

  if command -v eza &>/dev/null; then
    echo "--preview '(eza $EXA_HIDDEN_FLAG --icons --tree --color=always {} 2>/dev/null || tree $TREE_HIDDEN_FLAG -C {}) | head -200'"
  elif command -v tree &>/dev/null; then
    echo "--preview 'tree $TREE_HIDDEN_FLAG -C {} | head -200'"
  else
    echo "--preview 'ls -l$LS_HIDDEN_FLAG {} | head -200'"
  fi
}
  
__fzf_ctrl_t_opts() {
  if command -v bat &>/dev/null; then
    echo "--preview '(bat --style=numbers --color=always {} 2>/dev/null) | head -200'"
  else
    echo "--preview 'cat {} 2>/dev/null | head -200'"
  fi
}

# Set up fzf preview for various commands
__fzf_tab_complete_editor_preview() {
  if [[ -f ~/.fzf/.FZF_SHOW_HIDDEN ]]; then
    setopt globdots
    EXA_HIDDEN_FLAG="--all"
    LS_HIDDEN_FLAG="-A"
    TREE_HIDDEN_FLAG="-a"
  else
    unsetopt globdots
    EXA_HIDDEN_FLAG=""
    LS_HIDDEN_FLAG=""
    TREE_HIDDEN_FLAG=""
  fi
  echo "[[ -e \$realpath ]] \
    && (bat --style=numbers --color=always \"\$realpath\" 2>/dev/null || cat \"\$realpath\" 2>/dev/null) \
    || (eza $EXA_HIDDEN_FLAG --icons --tree --color=always \"\$realpath\" 2>/dev/null \
    || tree $TREE_HIDDEN_FLAG -C \"\$realpath\" 2>/dev/null \
    || ls -l$LS_HIDDEN_FLAG \"\$realpath\" 2>/dev/null) | head -200"
}

__fzf_tab_complete_cd_preview() {
  if [[ -f ~/.fzf/.FZF_SHOW_HIDDEN ]]; then
    setopt globdots
    EXA_HIDDEN_FLAG="--all"
    LS_HIDDEN_FLAG="-A"
    TREE_HIDDEN_FLAG="-a"
  else
    unsetopt globdots
    EXA_HIDDEN_FLAG=""
    LS_HIDDEN_FLAG=""
    TREE_HIDDEN_FLAG=""
  fi
  if command -v eza &>/dev/null; then
    echo "(eza $EXA_HIDDEN_FLAG --icons --tree --color=always \$realpath 2>/dev/null) | head -200"
  elif command -v tree &>/dev/null; then
    echo "(tree $TREE_HIDDEN_FLAG -C \$realpath 2>/dev/null) | head -200"
  else
    echo "(ls -l$LS_HIDDEN_FLAG \$realpath 2>/dev/null) | head -200"
  fi
}

if [[ ! -f $HOME/.fzf/fzf-git.sh ]]; then
  curl -fsSL https://raw.githubusercontent.com/junegunn/fzf-git.sh/master/fzf-git.sh -o $HOME/.fzf/fzf-git.sh
fi
source $HOME/.fzf/fzf-git.sh

__fzf_reload() {
  export FZF_DEFAULT_COMMAND="$(__fzf_default_command)"
  export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
  export FZF_ALT_C_COMMAND="$(__fzf_alt_c_command)"
  export FZF_ALT_C_OPTS="$(__fzf_alt_c_opts)"
  export FZF_CTRL_T_OPTS="$(__fzf_ctrl_t_opts)"
  export FZF_DEFAULT_OPTS="--multi \
    --bind='tab:down,shift-tab:up,ctrl-a:toggle-all,ctrl-space:toggle,ctrl-k:preview-up,ctrl-j:preview-down,ctrl-/:change-preview-window(50%,bottom|hidden|50%,right)'"


  zstyle ":fzf-tab:complete:${${EDITOR}:t}:*" fzf-preview "$(__fzf_tab_complete_editor_preview)"
  zstyle ':fzf-tab:complete:cd:*' fzf-preview "$(__fzf_tab_complete_cd_preview)"
  zstyle ':fzf-tab:*' switch-group ',' '.'
  zstyle ':fzf-tab:*' use-fzf-default-opts yes
  zstyle ':completion:*' menu no

  unset NO_COLOR
  KEYTIMEOUT=300
  zle -N fzf_tab_no_space_after_at                                                                 
  bindkey '^I' fzf_tab_no_space_after_at 
}

fzf_tab_no_space_after_at() {
  if (( CURSOR == ${#BUFFER} )) && [[ $BUFFER == *'@'*' ' ]]; then
    zle backward-delete-char
  fi
  fzf-tab-complete
}

if [[ -f ~/.fzf.zsh ]] && ! grep -q '^#\[' ~/.fzf.zsh; then
  awk '/^[[:space:]]*#/ {print; next} /\[\[ \$- == \*i\* \]\] && source "\${FZF_PATH}\/shell\/completion.zsh" 2> \/dev\/null/ {print "#" $0; next} {print}' ~/.fzf.zsh > ~/.fzf.zsh.tmp && mv ~/.fzf.zsh.tmp ~/.fzf.zsh
fi





