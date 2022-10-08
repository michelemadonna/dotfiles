
# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block, everything else may go below.

ZSH_DISABLE_COMPFIX=true

if [[ ! -d $(antibody home) ]]
then
	echo $(antibody home) "Not exists. Recreate the cache..."
	antibody bundle < ~/.zsh_plugins.txt > ~/.zsh_plugins.sh
	antibody update
fi

if [ $TERM_PROGRAM != "Apple_Terminal" ]
then
	neofetch
	if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
	  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
	fi
fi

# History
[ -z "$HISTFILE" ] && HISTFILE="$HOME/.zsh_history"
HISTSIZE=50000
SAVEHIST=10000
setopt extended_history
setopt hist_expire_dups_first
setopt hist_ignore_dups
setopt hist_ignore_space
setopt inc_append_history
setopt share_history

# Changing directories
setopt auto_cd
setopt auto_pushd
unsetopt pushd_ignore_dups
setopt pushdminus

# Completion
setopt auto_menu
setopt always_to_end
setopt complete_in_word
unsetopt flow_control
unsetopt menu_complete
zstyle ':completion:*:*:*:*:*' menu select
zstyle ':completion:*' matcher-list 'm:{a-zA-Z-_}={A-Za-z_-}' 'r:|=*' 'l:|=* r:|=*'
zstyle ':completion::complete:*' use-cache 1
zstyle ':completion::complete:*' cache-path 
zstyle ':completion:*' list-colors ''
zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([0-9]#) ([0-9a-z-]#)*=01;34=0=01'

# Other
setopt prompt_subst
DISABLE_AUTO_UPDATE=true
ZSH="$(antibody home)/https-COLON--SLASH--SLASH-github.com-SLASH-robbyrussell-SLASH-oh-my-zsh"

source ~/.zsh_plugins.sh

#zsh-history-substring-search key bindings
bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
if [ $TERM_PROGRAM != "Apple_Terminal" ]
then
	[[ ! -f ~/.p10k.zsh ]] ||  source ~/.p10k.zsh 
fi



if [ $TERM_PROGRAM != "Apple_Terminal" ]
then
	source $(dirname $(gem which colorls))/tab_complete.sh
	if brew command command-not-found-init > /dev/null; then
  		eval "$(brew command-not-found-init)";
	fi
fi
alias lsc='colorls'
alias grep="grep --color=auto"
alias duf="du -sh * | sort -hr"
alias less="less -r"
alias ls="ls -FG"
#export LSCOLORS='exfxcxdxbxegedabagacad'
#export CLICOLOR=true
export PATH="/usr/local/sbin:$PATH"
if type brew &>/dev/null; then
    FPATH=$(brew --prefix)/share/zsh-completions:$FPATH

    autoload -Uz compinit
    compinit
fi

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"
