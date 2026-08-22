#!/usr/bin/env zsh

# **Fix Zsh Git Autocompletion on macOS Homebrew Installs**
# Installing Git via Homebrew can break Zsh autocompletion for Git. 
# This Restore proper autocompletion.

## Add Homebrew's site functions to fpath (minus git, because that causes conflicts)
## This will give you autocomplete for _other_ things you installed
## from brew (like `just`, or `exa`, or `k6`)
if [[ $OSTYPE == darwin* && -d ${HOMEBREW_PREFIX:-/usr/local}/share/zsh/site-functions ]]; then
  # Append Homebrew completions so Zsh's existing _git keeps precedence.
  fpath+=("${HOMEBREW_PREFIX:-/usr/local}/share/zsh/site-functions")
  typeset -gU fpath
fi
