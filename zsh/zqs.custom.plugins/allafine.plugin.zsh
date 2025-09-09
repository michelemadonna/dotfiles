#!/usr/bin/env zsh

function allafine(){

    zle accept-line # Accept the current line
    tput cup 9999 0 # Move cursor to the bottom of the terminal
}
zle -N allafine # Define the allafine function for Zsh line editor
bindkey '^M' allafine # Bind Ctrl+M to the allafine function. Ctrl+M is often used as an alternative to Enter in some terminal applications.
