#!/usr/bin/env zsh


source $HOME/.asdf/plugins/java/set-java-home.zsh
#modify set-java-home.zsh with
#if [[ "$java_path" == "/usr/bin/java" ]]; then
#      JAVA_HOME="$(/usr/libexec/java_home)"
#    else
#      JAVA_HOME="$(dirname "$(dirname "${java_path:A}")")"
#fi
#and comment for maven $HOME/.asdf/plugins/maven/bin

#Custom Added
if [[ "$(uname -s)" == "Linux" ]]; then
  export ASDF_DATA_DIR="$ASDF_DIR"
  export PATH="$PATH:$ASDF_DATA_DIR/bin"
  export PATH="$ASDF_DATA_DIR/shims:$PATH"
# append completions to fpath
  fpath=(${ASDF_DIR}/completions $fpath)
# initialise completions with ZSH's compinit
  autoload -Uz compinit && compinit
fi

#if [[ "$(uname -s)" == "Linux" ]]; then
#  FORGIT_COPY_CMD='xclip -selection clipboard'
#fi