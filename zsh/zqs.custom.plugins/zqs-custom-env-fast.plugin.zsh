#!/usr/bin/env zsh
# Final interactive-shell customizations. Load after the other custom plugins.

[[ -n ${DOTFILES_DIR:-} ]] || export DOTFILES_DIR="${0:A:h:h:h}"

if [[ -z ${TMUX:-} ]]; then
  export TERM=xterm-256color
fi
[[ -n ${TERM_PROGRAM:-} ]] || export TERM_PROGRAM=xterm

alias tmux='TERM=screen-256color-bce tmux'
typeset -g TMUX_DEFAULT_SESSION=tmux
alias t='tmux a -d -t ${TMUX_DEFAULT_SESSION} 2>/dev/null || tmux new -s ${TMUX_DEFAULT_SESSION}'

zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*:descriptions' format '[%d]'
zstyle ':completion:*:*:docker:*' option-stacking yes
zstyle ':completion:*:*:docker-*:*' option-stacking yes
zstyle ':completion:*:git-checkout:*' sort false

alias _dig=dogggo _ping=gping _hex=hexyl _curl=http _ps=procs _top=btop
alias _ls='command ls' nodejs='command node'

if [[ $OSTYPE == darwin* ]]; then
  typeset -a _zqs_brew_handler_candidates
  [[ -n ${HOMEBREW_REPOSITORY:-} ]] &&
    _zqs_brew_handler_candidates+=("$HOMEBREW_REPOSITORY/Library/Homebrew/command-not-found/handler.sh")
  _zqs_brew_handler_candidates+=(
    "${HOMEBREW_PREFIX:-/usr/local}/Library/Homebrew/command-not-found/handler.sh"
    "${HOMEBREW_PREFIX:-/usr/local}/Homebrew/Library/Homebrew/command-not-found/handler.sh"
  )
  for _zqs_brew_handler in "$_zqs_brew_handler_candidates[@]"; do
    if [[ -r $_zqs_brew_handler ]]; then
      source "$_zqs_brew_handler"
      break
    fi
  done
  unset _zqs_brew_handler _zqs_brew_handler_candidates
fi

if [[ ${ZQS_ENABLE_ALLAFINE:-false} == true ]]; then
  allafine() {
    zle accept-line
    print -n $'\e[9999;1H'
  }
  zle -N allafine
  bindkey '^M' allafine

  if (( $+functions[_fzf-tab-apply] )); then
    functions[_zqs_orig_fzf_tab_apply]=$functions[_fzf-tab-apply]
    _fzf-tab-apply() {
      local -a prompt_lines=("${(@f)PS1}")
      print -n "\e[${#prompt_lines}A\e[2K\e[9999;1H"
      _zqs_orig_fzf_tab_apply "$@"
    }
  fi
fi

print -n $'\e[9999;1H'

if [[ ${ZQS_SHOW_FASTFETCH:-false} == true && -z ${ZQS_FASTFETCH_SHOWN:-} ]]; then
  # Exported markers are inherited by nested shells and tmux children, so
  # Fastfetch is displayed only once for the terminal/session.
  export ZQS_FASTFETCH_SHOWN=1
  if (( $+commands[fastfetch] )); then
    parent_cmd=$(ps -o comm= -p $PPID 2>/dev/null)
    case "${parent_cmd:l}" in
      *zed*|*code*|*micro*|*nvim*|*vim*|*idea*|*clion*|*goland*|*phpstorm*|*pycharm*|*tmux*|*fresh*|*helix*|*terminal*) ;;
      *) fastfetch --pipe false ;;
    esac
    unset parent_cmd
  else
    print -u2 "fastfetch not found. See $DOTFILES_DIR/Readme.md"
  fi
fi

if (( $+commands[fzf] )); then
  (( $+functions[__fzf_reload] )) && __fzf_reload

  __keybinds() {
    local data
    read -r -d '' data <<'EOF'
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
Ctrl+G then F                 │ fzf-git select files
Ctrl+G then B                 │ fzf-git select branches
Ctrl+G then T                 │ fzf-git select tags
Ctrl+G then R                 │ fzf-git select remotes
Ctrl+G then H                 │ fzf-git select commit hashes
Ctrl+G then S                 │ fzf-git select stashes
Ctrl+G then L                 │ fzf-git select reflogs
Ctrl+G then W                 │ fzf-git select worktrees
Ctrl+G then E                 │ fzf-git select refs

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
    print -r -- "$data" | fzf --ansi --no-multi --cycle --layout=reverse \
      --border=rounded --prompt='Keybinds ❯ ' --delimiter='│' --with-nth=1,2 \
      --preview-window=right:0%:wrap \
      --preview='echo "KEY:\n  {1}\n\nACTION:\n  {2}"'
  }
  zle -N __keybinds
  bindkey '^K' __keybinds
fi
