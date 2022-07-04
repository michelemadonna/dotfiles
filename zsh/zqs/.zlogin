#!/usr/bin/env zsh

_has() {
  return $(whence $1 >/dev/null)
}


# Use 256 color for tmux.
alias tmux="TERM=screen-256color-bce tmux"
# Attempt to take over existing sessions before creating a new tmux session.
TMUX_DEFAULT_SESSION="tmux"
alias t="tmux a -d -t ${TMUX_DEFAULT_SESSION} 2> /dev/null || tmux new -s ${TMUX_DEFAULT_SESSION}"
if [[ -z "$TMUX" ]]; then
  # Switch to xterm if we're in a tmux session.
  TERM="xterm-256color"
fi


if [ $TERM_PROGRAM != "Apple_Terminal" ]; then
  neofetch
fi


if _has rg; then
  export RIPGREP_CONFIG_PATH="$HOME/.ripgreprc"
fi

if _has bat; then
  # Export theme for http://github.com/sharkdp/bat.
  export BAT_THEME="Solarized (dark)"
fi

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

  FZF_CTRL_T_OPTS="--preview '(bat --style=numbers --color=always {} || highlight -O ansi -l {} || coderay {} || rougify {} || cat {}) 2> /dev/null | head -200'"

  # Some basic fzf-tab configs.
  
  zstyle ':fzf-tab:complete:cd:*' fzf-preview '(exa --tree --color=always $realpath || tree -C $realpath) 2> /dev/null'
  zstyle ':completion:*:descriptions' format '[%d]'
  zstyle ':fzf-tab:*' switch-group ',' '.'

fi

# Add jenv oh-my-zsh plugin to .zgen-setup
#zgenom oh-my-zsh plugins/jenv



if _has jenv; then
  eval "$(jenv init -)"
fi


#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"

#echo "removing current jenv java's to readd them freshly"
#jenv versions --bare | xargs -n1 jenv remove
#echo "adding all sdkmans java versions to jenv"
#find $HOME/.sdkman/candidates/java -type d -maxdepth 1 -mindepth 1 -exec jenv add '{}' \;
#jenv enable-plugin maven
#jenv enable-plugin export





#. /usr/local/opt/asdf/libexec/asdf.sh

#Custom Added
alias lsc='colorls'



