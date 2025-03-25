#!/usr/bin/env zsh


source $HOME/.asdf/plugins/java/set-java-home.zsh
#modify set-java-home.zsh with

######
#asdf_update_java_home() {
#  local java_path
#  java_path="$(asdf which java)"
#  if [[ -n "${java_path}" ]]; then
#    export JAVA_HOME
#    if [[ "$java_path" == "/usr/bin/java" ]]; then
#      JAVA_HOME="$(/usr/libexec/java_home)"
#    else  
#      JAVA_HOME="$(dirname "$(dirname "${java_path:A}")")"
#    fi
#    export JAVA_HOME=${JAVA_HOME}
#    export JDK_HOME=${JAVA_HOME}
#  fi
#}
#
#autoload -U add-zsh-hook
#add-zsh-hook precmd asdf_update_java_home
######


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
