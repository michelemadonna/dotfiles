#!/usr/bin/env zsh

# Configure fzf (if available).
if _has fzf; then
  if _has fd; then
    # Use fd for fzf.
    FZF_DEFAULT_COMMAND='fd --type f --follow --hidden'
    FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
    # Use fd for fzf directory search.
    FZF_ALT_C_COMMAND='fd --type d --color never'
  fi

  # Display source tree and file preview for CTRL-T and ALT-C.
  if _has tree; then
    # Show subdir tree for directories.
    FZF_ALT_C_OPTS="--preview '(exa --tree --color=always {} || tree -C {}) | head -200'"
  fi

  # Bind alt-j/k/d/u to moving the preview window for fzf.
  FZF_DEFAULT_OPTS="--bind alt-k:preview-up,alt-j:preview-down,alt-u:preview-page-up,alt-d:preview-page-down"

  # Show previews for files and directories.
  # Having `bat` or `highlight` (or any of the other binaries below) installed
  # enables syntax highlighting.

  FZF_CTRL_T_OPTS="--preview '(bat --style=numbers --color=always {} || highlight -O ansi -l {} || coderay {} || rougify {} || cat {}) 2> /dev/null | head 
-200'"

  # Some basic fzf-tab configs.
  zstyle ':fzf-tab:complete:cd:*' fzf-preview '(exa --tree --color=always $realpath || tree -C $realpath) 2> /dev/null'
  zstyle ':completion:*:descriptions' format '[%d]'
  zstyle ':fzf-tab:*' switch-group ',' '.'

fi
