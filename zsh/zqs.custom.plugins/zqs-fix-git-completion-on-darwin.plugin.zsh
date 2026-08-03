#!/usr/bin/env zsh

# **Fix Zsh Git Autocompletion on macOS Homebrew Installs**
# Installing Git via Homebrew can break Zsh autocompletion for Git. 
# This Restore proper autocompletion.

## Add Homebrew's site functions to fpath (minus git, because that causes conflicts)
## This will give you autocomplete for _other_ things you installed
## from brew (like `just`, or `exa`, or `k6`)
if [ $(uname -a | grep -ci Darwin) = 1 ]; then
	[ -e "$HOMEBREW_PREFIX/share/zsh/site-functions/_git" ] && rm "$HOMEBREW_PREFIX/share/zsh/site-functions/_git"
  fpath=($HOMEBREW_PREFIX/share/zsh/site-functions $fpath)
fi