#!/usr/bin/env zsh
# this file is responsible for setting up my zqs optionated env

_has() {
  return $(whence $1 >/dev/null)
}

if [[ ! -n "$DOTFILES_DIR" ]]; then
  export DOTFILES_DIR="${0:A:h:h:h}"
fi

FILENAME="${0:a}"
echo $FILENAME
if [ $(echo $FILENAME | grep -ci plugin) = 1 ]; then
    ln -sfn "$FILENAME" "$HOME/.zshrc.d/ZZZZZZ_temp.zsh"

    if [[ -L "$HOME/.zsh_functions" ]]; then
        rm "$HOME/.zsh_functions" 
    fi

    if [[ -L "$HOME/.zsh_functions" ]]; then
        rm "$HOME/.zsh_aliases" 
    fi

    if [[ -f "$HOME/.zqs/zsh/.zsh_functions" ]]; then
        source "$HOME/.zqs/zsh/.zsh_functions" 
    fi

    if [[ -f "$HOME/.zqs/zsh/.zsh_aliases" ]]; then
        source "$HOME/.zqs/zsh/.zsh_aliases" 
    fi

    if [[ -z "$TMUX" ]]; then # Switch to xterm if we're in a tmux session.
      TERM="xterm-256color"
    fi

    if [ -z $TERM_PROGRAM ]; then # Set TERM_PROGRAM if not already set
      export TERM_PROGRAM=xterm	
    fi

    # Use 256 color for tmux.
    alias tmux="TERM=screen-256color-bce tmux"
    # Attempt to take over existing sessions before creating a new tmux session.
    TMUX_DEFAULT_SESSION="tmux"
    alias t="tmux a -d -t ${TMUX_DEFAULT_SESSION} 2> /dev/null || tmux new -s ${TMUX_DEFAULT_SESSION}"


    if _has rg; then 
      export RIPGREP_CONFIG_PATH="$HOME/.ripgreprc"
    fi

    if _has bat; then
      # Export theme for http://github.com/sharkdp/bat.
      export BAT_THEME="Solarized (dark)"
    fi

    export EZA_COLORS="da=1;36;0"

    export LS_COLORS='di=1;34;0:ln=2;2:so=32;40:pi=33;40:ex=31;40:bd=34;46:cd=34;43:su=0;41:sg=0;46:tw=0;42:ow=0;43:'
    zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
    zstyle ':completion:*:descriptions' format '[%d]' # Set description format for completion
    zstyle ':completion:*:*:docker:*' option-stacking yes
    zstyle ':completion:*:*:docker-*:*' option-stacking yes
    zstyle ':completion:*:git-checkout:*' sort false


    alias _dig="dogggo"
    alias _ping="gping"
    alias _hex="hexyl"
    alias _curl="http"
    alias _ps="procs"
    alias _top="btop"
    alias _ls="command ls"

    alias nodejs="command node"

    if _has eza; then
        echo "creo alias"
        alias ls="eza"

        alias ls="eza --icons --git --group --time-style=long-iso --group-directories-first --color-scale"

        alias lls="eza -bghHliS@Z --time-style=long-iso"

        alias ll="eza --group --time-style=long-iso -las modified"

    fi
    

    if [[ -L "$HOME/.zshenv" || -f "$HOME/.zshenv" ]]; then
        source "$HOME/.zshenv" 
    fi
    
else

    # this file is sourced by zshrc to set up allafine integration.
    # it moves the cursor to the bottom of the terminal when pressing Enter.
    if [[ "${ZQS_ENABLE_ALLAFINE}" == "true" ]]; then
      function allafine(){

          zle accept-line # Accept the current line
          tput cup 9999 0 # Move cursor to the bottom of the terminal
      }
      zle -N allafine # Define the allafine function for Zsh line editor
      bindkey '^M' allafine # Bind Ctrl+M to the allafine function. Ctrl+M is often used as an alternative to Enter in some terminal applications.

      if whence -w _fzf-tab-apply >/dev/null; then
        _orig_fzf_tab_apply=${functions[_fzf-tab-apply]}
        _fzf-tab-apply() {
          # --- PRE-HOOK: delete previous prompt line(s) ---
          local lines
          lines=$(echo -n "$PS1" | wc -l)   # number of lines your PS1 takes
          print -n "\033[${lines}A\033[2K"   # move up and clear those lines
          # --- CALL original _fzf-tab-apply ---
          print -n "$(tput cup 9999 0)"
          eval "$_orig_fzf_tab_apply" "$@"
        }
      fi
    fi

    tput cup 9999 0 # Move cursor to the bottom of the terminal

    if [[ "$ZQS_SHOW_FASTFETCH" == "true" ]]; then
      if command -v fastfetch &> /dev/null; then
      
        #show fastfetch when opening a new terminal, but not when opening an editor or IDE from the terminal
        # Set up fastfetch to run only if the parent command is not an editor or IDE
        # This prevents fastfetch from running in editors like VSCode, Neovim, etc.
        parent_cmd=$(ps -o comm= -p $(ps -o ppid= -p $$))
        if ! echo "$parent_cmd" | grep -qiE 'zed|code|micro|nvim|vim|idea|clion|goland|phpstorm|pycharm|tmux|fresh|helix|Terminal'; then
          fastfetch --pipe false
        fi
      else
          echo "fastfetch not found. Please refer to $DOTFILES_DIR/Readme.md for installation instructions."
          exit 1
      fi
    fi

    

    # load fzf-tab completion if fzf is installed
    (( ! $+commands[fzf] )) && return
    if whence -w __fzf_reload >/dev/null; then
      __fzf_reload
    fi 

    rm -f "$HOME/.zshrc.d/ZZZZZZ_temp.zsh"
fi
