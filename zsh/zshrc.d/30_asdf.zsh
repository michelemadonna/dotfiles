#!/usr/bin/env zsh




##Custom Added
#if [[ "$(uname -s)" == "Linux" ]]; then
#  export ASDF_DATA_DIR="${ASDF_DATA_DIR:-$HOME/.asdf}"
#  export PATH="$PATH:$ASDF_DATA_DIR/bin"
#  export PATH="$ASDF_DATA_DIR/shims:$PATH"
#  if [ ! -d "${ASDF_DATA_DIR}/completions" ] 
#  then
#    mkdir -p "${ASDF_DATA_DIR:-$HOME/.asdf}/completions"
#    asdf completion zsh > "${ASDF_DATA_DIR:-$HOME/.asdf}/completions/_asdf"
#    
#  fi
#
## append completions to fpath
#  fpath=(${ASDF_DATA_DIR}/completions $fpath)
## initialise completions with ZSH's compinit
#  autoload -Uz compinit && compinit
#fi
if [ ! -d "${ASDF_DATA_DIR:-$HOME/.asdf}/plugins/java" ]
then
  source ${ASDF_DATA_DIR:-$HOME/.asdf}/plugins/java/set-java-home.zsh
fi
if [ ! -d "${ASDF_DATA_DIR:-$HOME/.asdf}/plugins/nodejs" ]
then
  ln -s ${ASDF_DATA_DIR:-$HOME/.asdf}shims/node ${ASDF_DATA_DIR:-$HOME/.asdf}/shims/nodejs
fi
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
