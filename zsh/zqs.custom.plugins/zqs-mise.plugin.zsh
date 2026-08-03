#!/usr/bin/env zsh
# mise plugin for zsh
# this plugin integrates mise (https://github.com/mise/mise) into zsh shell

if [[ ! -n "$DOTFILES_DIR" ]]; then
  export DOTFILES_DIR="${0:A:h:h:h}"
fi

# TODO: 2024-01-03 remove rtx support
local __mise=mise
if (( ! $+commands[mise] )); then
  if (( $+commands[rtx] )); then
    __mise=rtx
  else
    return
  fi
fi

#this is needed by powerlevel10k to show the mise segment using asdf segment configuration
export ASDF_DATA_DIR="${XDG_DATA_HOME:-$HOME/.local/share}/asdf"

if [[ ! -d "$ASDF_DATA_DIR" ]]; then
  mkdir -p "$ASDF_DATA_DIR"
  git clone https://github.com/asdf-vm/asdf-plugins.git "$ASDF_DATA_DIR"

  for file in "$ASDF_DATA_DIR/plugins"/*; do
    local dir_name="${file##*/}"
    rm "$file"
    mkdir -p "$ASDF_DATA_DIR/plugins/$dir_name"
  done
fi

# remove zqs file that loads mise if present
if [ -f "$HOME/.zshrc.d/001-load-mise-if-present" ]; then
    rm "$HOME/.zshrc.d/001-load-mise-if-present"
fi


# Load mise hooks
eval "$($__mise --quiet activate zsh)"

# Hook mise into current environment
eval "$($__mise hook-env -s zsh)"

asdf() {
  command mise --quiet "$@"
}
_mise_hook_chpwd () {
        eval "$("$(whence -p mise)" --quiet hook-env -s zsh --reason chpwd)"
}
_mise_hook_precmd () {
        eval "$("$(whence -p mise)" --quiet hook-env -s zsh --reason precmd)"
}

# If the completion file doesn't exist yet, we need to autoload it and
# bind it to `mise`. Otherwise, compinit will have already done that.
if [[ ! -f "$ZSH_CACHE_DIR/completions/_$__mise" ]]; then
  typeset -g -A _comps
  autoload -Uz _$__mise
  _comps[$__mise]=_$__mise
fi

# Generate and load mise completion
$__mise --quiet completion zsh >| "$ZSH_CACHE_DIR/completions/_$__mise" &|
compinit -u "$ZSH_CACHE_DIR/completions/_$__mise"
unset __mise

if [ $(uname -a | grep -ci Linux) = 1 ] && ! command mise list -q -i usage | grep -q "usage"; then
  mise use usage
fi


# Wrap mise to update .tool-versions on `mise use`. tool versions are
# translated to asdf format and saved in .tool-versions in the current
# directory or in $HOME/.tool-versions if `mise use -g` is used for global
# version changes. This is needed by powerlevel10k to show the current
# versions in the prompt using the asdf segment.
# The function also adds fzf-based version selection that lists only the
# versions installed for the specified runtime when the user types `mise use
# <runtime>@` and presses tab for completion.
if whence -w _mise >/dev/null; then
  _mise 2>/dev/null
  functions[_mise_orig]=$functions[_mise]
  functions[mise_orig]=$functions[mise]
fi

_mise () {
  if [[ $words[2] == use ]]; then
    local idx=3

    if [[ $words[3] == -g ]]; then
      idx=4
    fi

    if [[ ${words[$idx]} == *[@]* ]]; then
      local runtime=${words[$idx]%@*}
      local prefix=${words[$idx]}
      local versions
      
      versions=$(command mise ls --quiet "$runtime" | awk '{print $2}' | sort -V)
      
      if mise exec "$runtime@system" -- true > /dev/null 2>&1; then
        versions=$(printf "%s\n" $versions | grep -vx "system")
        versions="system"$'\n'"$versions"
      fi
      
      if [ -z "$versions" ]; then
        echo "⚠️ No versions installed for '$tool'."
        echo "👉 Install with: mise install ${tool}@<version>"
        return 1
      fi
      
      if command -v fzf > /dev/null 2>&1; then
        chosen=$(echo "$versions" | fzf --ansi --prompt="Select version > " --height=20 --reverse)
        if [[ $LBUFFER == *@ ]]; then
          # senza spazio → completa con runtime@version
          compadd -Q -S '' -- "${runtime}@${chosen}"
        else
          # con spazio dopo @ → completa solo la versione
          compadd -Q -S '' -- "${chosen}"
        fi
        return 0
      fi
      return 0
    fi
  fi
  _mise_orig "$@"
}

# Translate mise runtime@version to asdf format and save to .tool-versions
_mise_runtime_to_asdf() {
  local spec="$1"
  local runtime="${spec%@*}"   
  local version="${spec#*@}"   
  local file=".tool-versions"

  if [[ "$2" == "-g" ]]; then
    file="$HOME/$file"
  fi

  if [[ "$runtime" == "$version" ]]; then
    version=$(mise_orig current "$runtime" | awk -v r="$runtime" '{print r, $1}' )
  fi

  if [[ "$runtime" == "node" ]]; then
    runtime="nodejs"
  fi

  [[ -f "$file" ]] || touch "$file"

  if [ $(uname -a | grep -ci Darwin) = 1 ]; then
    # macOS
    sed -i '' "/^$runtime /d" "$file"
  else  
    # Linux
    sed -i "/^$runtime /d" "$file"
  fi  

  echo "$runtime $version" >> "$file"
}

mise () {
  if [[ "$1" == "use" ]]; then
    shift
    local global_flag=""
    if [[ "$1" == "-g" ]]; then
      global_flag="-g"
      shift
    fi
    local runtime_spec="$1"
    shift

    mise_orig use $global_flag "$runtime_spec""$@" || return "$?"

    if [[ -n "$runtime_spec" ]]; then
      _mise_runtime_to_asdf "$runtime_spec""$@" "$global_flag"
    fi
  else
    mise_orig "$@"
  fi
}
