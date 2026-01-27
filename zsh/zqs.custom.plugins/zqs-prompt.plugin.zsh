#!/usr/bin/env zsh
# this file is responsible for setting up oh-my-posh
if [[ ! -n "$DOTFILES_DIR" ]]; then
  export DOTFILES_DIR="${0:A:h:h:h}"
fi


# Be compatible with the old settings files for now
if [[ -z "${ZQS_PROMPT}" || "${ZQS_PROMPT}" != "ohmyposh" ]]; then
  if [[ $(_zqs-get-setting bullet-train false) == 'true' ]]; then
    # Bullet train prompt setup.
    zgenom load https://github.com/caiogondim/bullet-train.zsh
  else
    # p10k is faster and what I'm using now, so it is the new default
    echo "🎨 Switch to powerlevel10k prompt"
    if [[ ! -L "$HOME/.p10k.zsh" ]] || ! head -n 2 "$HOME/.p10k.zsh" | grep -q "powerlevel10k"; then
      zgenom reset
      ln -sfn "$DOTFILES_DIR/powerlevel10k/.p10k.zsh" "$HOME/.p10k.zsh"
      zgenom load romkatv/powerlevel10k powerlevel10k
    fi
    
    
  fi
else
  
  if [[ ! -L "$HOME/.p10k.zsh" ]] || ! head -n 2 "$HOME/.p10k.zsh" | grep -q "oh-my-posh"; then
    echo "🎨 Switch to oh-my-posh prompt"
    zgenom reset
    ln -sfn "$DOTFILES_DIR/oh-my-posh/start_oh_my_posh.zsh" "$HOME/.p10k.zsh"
  fi
fi




