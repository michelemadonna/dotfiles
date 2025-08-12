#!/usr/bin/env zsh

# "This file is sourced by zshrc to set up environment variables, functions and basic configurations."
#if micro is installed set micro as default editor else nano



_has() {
  return $(whence $1 >/dev/null)
}

if _has micro; then
  export VISUAL=micro # Set default editor to micro
else
  export VISUAL=nano # Set default editor to nano
fi

export EDITOR="$VISUAL"

if [[ -z "$TMUX" ]]; then # Switch to xterm if we're in a tmux session.
  TERM="xterm-256color"
fi

if [ -z $TERM_PROGRAM ]; then # Set TERM_PROGRAM if not already set
  export TERM_PROGRAM=xterm	
fi

if _has rg; then 
  export RIPGREP_CONFIG_PATH="$HOME/.ripgreprc"
fi

if _has bat; then
  # Export theme for http://github.com/sharkdp/bat.
  export BAT_THEME="Solarized (dark)"
fi


export LS_COLORS='di=1;34;0:ln=2;2:so=32;40:pi=33;40:ex=31;40:bd=34;46:cd=34;43:su=0;41:sg=0;46:tw=0;42:ow=0;43:'
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*:descriptions' format '[%d]' # Set description format for completion


tput cup 9999 0 # Move cursor to the bottom of the terminal

# Set up fastfetch to run only if the parent command is not an editor or IDE
# This prevents fastfetch from running in editors like VSCode, Neovim, etc.
if _has fastfetch; then
  parent_cmd=$(ps -o comm= -p $(ps -o ppid= -p $$))
  if ! echo "$parent_cmd" | grep -qiE 'zed|code|micro|nvim|vim|idea|clion|goland|phpstorm|pycharm|tmux|Terminal'; then
    fastfetch --pipe false
  fi
fi

# **Fix Zsh Git Autocompletion on macOS Homebrew Installs**
# Installing Git via Homebrew can break Zsh autocompletion for Git. 
# This Restore proper autocompletion.

export GIT_VERSION=$(git --version | awk '{print $3}')

if [ $(uname -a | grep -ci Darwin) = 1 ]; then
  # Paths
  git_link="/usr/local/Cellar/git/${GIT_VERSION}/share/zsh/site-functions/_git"
  zsh_target="/usr/share/zsh/${ZSH_VERSION}/functions/_git"

  # Check if the file exists and is not a symlink, or if it's a symlink but points elsewhere
  if { [[ -e "$git_link" && ! -L "$git_link" ]] || [[ -L "$git_link" && "$(readlink "$git_link")" != "$zsh_target" ]] }; then
      echo "🔗 Updating symbolic link for _git..."
      rm -rf "$git_link"
      ln -s "$zsh_target" "$git_link"
  fi
fi







