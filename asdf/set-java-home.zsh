asdf_update_java_home() {
  local java_path
  java_path="$(asdf which java)"
  if [[ -n "${java_path}" ]]; then
    export JAVA_HOME
    if [[ "$OSTYPE" == "darwin"* && "${java_path}" == "/usr/bin/java" ]]; then
    	JAVA_HOME="$(/usr/libexec/java_home)"
    else	
    	JAVA_HOME="$(dirname "$(dirname "${java_path:A}")")"
    fi
    export JDK_HOME=${JAVA_HOME}
  fi
}

autoload -U add-zsh-hook
add-zsh-hook precmd asdf_update_java_home
