#!/usr/bin/env zsh
# this file is responsible for setting up my zqs optionated env

_has() {
  return $(whence $1 >/dev/null)
}

if [[ ! -n "$DOTFILES_DIR" ]]; then
  export DOTFILES_DIR="${0:A:h:h:h}"
fi

FILENAME="${0:a}"
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


else
    if [[ -L "$HOME/.zshenv" || -f "$HOME/.zshenv" ]]; then
        source "$HOME/.zshenv" 
    fi
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
    
    function __keybinds() {
  local data
  data=$(
    cat <<'EOF'
----------------------------------------------------------------------------------
🐚 Zsh
----------------------------------------------------------------------------------
Ctrl+R                        │ Search history (fzf)
Esc Esc                       │ Insert sudo before the last command
Ctrl+T                        │ Fuzzy file path completion (fzf)
Alt+C / Esc+C                 │ cd into a selected subdirectory (fzf)
Tab                           │ Open autocomplete menu with fzf-tab
Ctrl+H                        │ Toggle hidden files in FZF search

----------------------------------------------------------------------------------
🔍 fzf
----------------------------------------------------------------------------------
↑ / ↓                         │ Move up/down
Tab                           │ Cycle selection
Ctrl+Space                    │ Mark / unmark item
Ctrl+A                        │ Toggle all marked / unmarked
Enter                         │ Select current item(s)
Ctrl+P                        │ Toggle / move preview window
Ctrl+J / K                    │ Scroll preview down / up
, / .                         │ Switch group (fzf-tab)
Ctrl+G then ?                 │ Show all available fzf-git shortcuts
Ctrl+G then F                 │ fzf-git select **F**iles (e.g., for `git add`)
Ctrl+G then B                 │ fzf-git select **B**ranches
Ctrl+G then T                 │ fzf-git select **T**ags
Ctrl+G then R                 │ fzf-git select **R**emotes
Ctrl+G then H                 │ fzf-git select commit **H**ashes
Ctrl+G then S                 │ fzf-git select **S**tashes
Ctrl+G then L                 │ fzf-git select ref**l**ogs
Ctrl+G then W                 │ fzf-git select **W**orktrees
Ctrl+G then E                 │ fzf-git select refs via `git for-**e**ach-ref`

----------------------------------------------------------------------------------
🔀 tmux
----------------------------------------------------------------------------------
Alt+A                         │ Prefix key
Prefix then C                 │ New window
Prefix then -                 │ Horizontal split
Prefix then |                 │ Vertical split
Prefix then d                 │ Detach session
Prefix then +                 │ Zoom current pane
Prefix then ↑↓←→              │ Move between panes
Prefix then Alt+Shift ↑↓←→    │ Resize panes
Prefix then R                 │ Reload tmux config
Prefix then Alt+S             │ Sync input to all panes
Prefix then Ctrl+S            │ Hide status bar

----------------------------------------------------------------------------------
✏️ micro
----------------------------------------------------------------------------------
Ctrl+O                        │ Open file
Ctrl+S                        │ Save
Ctrl+Q                        │ Quit
Ctrl+F                        │ Find
Ctrl+Z / Y                    │ Undo / Redo
Ctrl+X/C/V                    │ Cut / Copy / Paste
Ctrl+E                        │ Open command bar
Ctrl+T                        │ New tab
Alt+, / .                     │ Previous / Next tab
Ctrl+R                        │ Toggle line numbers
EOF
  )

  print -r -- "$data" |
    fzf --ansi \
        --no-multi \
        --cycle \
        --layout=reverse \
        --border=rounded \
        --prompt="Keybinds ❯ " \
        --delimiter='│' \
        --with-nth=1,2 \
        --preview-window=right:0%:wrap \
        --preview='
          if [[ "{}" == $"\033[1m"* ]]; then
            echo "{}"
          else
            echo "KEY:\n  {1}\n\nACTION:\n  {2}"
          fi
        '
  }
    
    zle -N __keybinds
    bindkey '^K' __keybinds 

    rm -f "$HOME/.zshrc.d/ZZZZZZ_temp.zsh"
fi
