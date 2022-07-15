# If you come from bash you might have to change your $PATH.
export PATH=$HOME/bin:/usr/local/bin:$PATH

source ~/.antigen/antigen.zsh

alias lc='colorls --sd'



POWERLEVEL9K_MODE='nerdfont-complete'
#POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(context dir rbenv vcs)
POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(ssh dir rbenv vcs)
POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(status root_indicator background_jobs history time)

# Load the oh-my-zsh's library.
antigen use oh-my-zsh

# Bundles from the default repo (robbyrussell's oh-my-zsh).
#antigen bundle atom
#antigen bundle aws
antigen bundle bundler
antigen bundle common-aliases
#antigen bundle gem
antigen bundle git
antigen bundle git-extras
#antigen bundle github
#antigen bundle httpie
#antigen bundle mvn
antigen bundle jsontools
antigen bundle last-working-dir
antigen bundle osx
#antigen bundle ruby
#antigen bundle rvm
antigen bundle wd
antigen bundle colored-man
antigen bundle colorize
antigen bundle cp
antigen bundle extract
antigen bundle brew
antigen bundle brew-cask
antigen bundle unixorn/autoupdate-antigen.zshplugin
#brew tap homebrew/command-not-found
#if brew command command-not-found-init > /dev/null 2>&1; then eval "$(brew command-not-found-init)"; fi
antigen bundle command-not-found
antigen bundle rupa/z
antigen bundle zsh-users/zsh-syntax-highlighting
antigen bundle zsh-users/zsh-completions src
antigen bundle zsh-users/zsh-history-substring-search
antigen bundle zsh-users/zsh-autosuggestions

# Load the theme.
antigen theme romkatv/powerlevel10k
# Tell antigen that you're done.
antigen apply


