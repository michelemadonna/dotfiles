#!/usr/bin/env zsh

# Add jenv oh-my-zsh plugin to .zgen-setup
#zgenom oh-my-zsh plugins/jenv
#if _has jenv; then
#  eval "$(jenv init -)"
#fi


#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
#export SDKMAN_DIR="$HOME/.sdkman"
#[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"
#echo "removing current jenv java's to readd them freshly"
#jenv versions --bare | xargs -n1 jenv remove
#echo "adding all sdkmans java versions to jenv"
#find $HOME/.sdkman/candidates/java -type d -maxdepth 1 -mindepth 1 -exec jenv add '{}' \;
#jenv enable-plugin maven
#jenv enable-plugin export


export ASDF_DATA_DIR="$ASDF_DIR"
export PATH="$PATH:$ASDF_DATA_DIR/bin"
export PATH="$ASDF_DATA_DIR/shims:$PATH"

#source /usr/local/opt/asdf/libexec/asdf.sh
source $HOME/.asdf/plugins/java/set-java-home.zsh
#export PATH=$HOME/.asdf/shims/node:$PATH
#modify set-java-home.zsh with
#if [[ "$java_path" == "/usr/bin/java" ]]; then
#      JAVA_HOME="$(/usr/libexec/java_home)"
#    else
#      JAVA_HOME="$(dirname "$(dirname "${java_path:A}")")"
#fi
#and comment for maven $HOME/.asdf/plugins/maven/bin

#Custom Added
if [[ "$(uname -s)" == "Linux" ]]; then
# append completions to fpath
  fpath=(${ASDF_DIR}/completions $fpath)
# initialise completions with ZSH's compinit
  autoload -Uz compinit && compinit
fi

