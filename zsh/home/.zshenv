
(( $path[(Ie)"$HOME/.local/bin"] )) || path+=("$HOME/.local/bin")


export EDITOR=micro
export VISUAL="$EDITOR"

export ZQS_SHOW_FASTFETCH=true
#export DOTFILES_DIR=$HOME/.dotfiles
#export ZQS_OH_MY_POSH_CONFIG="$DOTFILES_DIR/local/oh-my-posh/custom.omp.json"

export ZQS_ENABLE_ALLAFINE=true


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

