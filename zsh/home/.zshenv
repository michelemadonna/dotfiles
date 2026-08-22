
(( $path[(Ie)"$HOME/.local/bin"] )) || path+=("$HOME/.local/bin")

export MISE_QUIET=1

export EDITOR=micro
export VISUAL="$EDITOR"

export ZQS_SHOW_FASTFETCH=true
#export DOTFILES_DIR=$HOME/.dotfiles
#export ZQS_OH_MY_POSH_CONFIG="$DOTFILES_DIR/local/oh-my-posh/custom.omp.json"

export ZQS_ENABLE_ALLAFINE=true

# zsh-quickstart assigns QUICKSTART_KIT_REFRESH_IN_DAYS later in .zshrc. Keep
# the policy in the early environment; the late fragment applies the unset
# after that assignment so the synchronous check stays disabled.
typeset -g ZQS_DISABLE_QUICKSTART_SYNC_UPDATES=1

# Keep unixorn/fzf-zsh-plugin's helper functions and scripts without sourcing
# ~/.fzf.zsh twice. Quickstart loads the real file once later.
if (( $+commands[fzf] )); then
    export FZF_PATH="${DOTFILES_DIR:-$HOME/.dotfiles}/zsh/fzf"
fi

# Quickstart and ~/.fzf.zsh only need two immutable Homebrew prefixes during
# interactive startup. Avoid spawning brew repeatedly, then restore the real
# command before drawing the first prompt.
if [[ -o interactive && $OSTYPE == darwin* ]] &&
   (( $+commands[brew] && ! $+functions[brew] )); then
    typeset -g _ZQS_BREW_COMMAND=${commands[brew]}
    typeset -g _ZQS_BREW_PREFIX=${HOMEBREW_PREFIX:-${commands[brew]:h:h}}
    typeset -g _ZQS_FZF_BREW_PREFIX="$_ZQS_BREW_PREFIX/opt/fzf"

    brew() {
        if (( $# == 1 )) && [[ $1 == --prefix ]]; then
            print -r -- "$_ZQS_BREW_PREFIX"
        elif (( $# == 2 )) && [[ $1 == --prefix && $2 == fzf ]]; then
            print -r -- "$_ZQS_FZF_BREW_PREFIX"
        else
            command "$_ZQS_BREW_COMMAND" "$@"
        fi
    }

    _zqs_restore_brew_command() {
        autoload -Uz add-zsh-hook
        add-zsh-hook -d precmd _zqs_restore_brew_command
        unfunction brew _zqs_restore_brew_command
        unset _ZQS_BREW_COMMAND _ZQS_BREW_PREFIX _ZQS_FZF_BREW_PREFIX
    }

    autoload -Uz add-zsh-hook
    add-zsh-hook precmd _zqs_restore_brew_command
fi


if $(whence rg >/dev/null); then 
    export RIPGREP_CONFIG_PATH="$HOME/.ripgreprc"
fi

if $(whence bat >/dev/null); then
    # Export theme for http://github.com/sharkdp/bat.
    export BAT_THEME="Solarized (dark)"
fi

export EZA_COLORS="da=1;36;0"
export LS_COLORS='di=1;34;0:ln=2;2:so=32;40:pi=33;40:ex=31;40:bd=34;46:cd=34;43:su=0;41:sg=0;46:tw=0;42:ow=0;43:'

if $(whence eza >/dev/null); then
    ls_analog='eza'
elif $(whence exa >/dev/null); then
    ls_analog='exa'
fi

if [ -v ls_analog ]; then
    aliases[ls]="$ls_analog"
    alias ls="${aliases[ls]:-ls} --icons --git --group --time-style=long-iso --group-directories-first --color-scale"
    alias lls="${aliases[ls]:-ls} -bghHliS@Z --time-style=long-iso"
    alias ll="${aliases[ls]:-ls} --group --time-style=long-iso -las modified"
fi
