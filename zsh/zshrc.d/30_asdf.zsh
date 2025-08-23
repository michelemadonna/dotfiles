#!/usr/bin/env zsh

#This file is sourced by zshrc to set up asdf integration.
(( ! $+commands[asdf] )) && return

export ASDF_DATA_DIR="${ASDF_DATA_DIR:-$HOME/.asdf}"

if [ $(uname -a | grep -ci Linux) = 1 ]; then
	# Add shims to the front of the path, removing if already present.
	path=("$ASDF_DATA_DIR/shims" ${path:#$ASDF_DATA_DIR/shims})

	# If the completion file doesn't exist yet, we need to autoload it and
	# bind it to `asdf`. Otherwise, compinit will have already done that.
	if [[ ! -f "$ZSH_CACHE_DIR/completions/_asdf" ]]; then
		typeset -g -A _comps
		autoload -Uz _asdf
		_comps[asdf]=_asdf
	fi
	asdf completion zsh >| "$ZSH_CACHE_DIR/completions/_asdf"
	if [ -e "$ZSH_CACHE_DIR/completions/_asdf" ] && ! tail -n 5 "$ZSH_CACHE_DIR/completions/_asdf" | grep -q "p_a_t_c_h_e_d"; then
		patch "$(readlink -f "$ZSH_CACHE_DIR/completions/_asdf" < "$DOTFILES_DIR/asdf_zsh_completition.patch"
	fi
fi

####This is a fix for https://github.com/asdf-vm/asdf/issues/2047
if [ $(uname -a | grep -ci Darwin) = 1 ]; then
	if [ -e "$HOMEBREW_PREFIX/share/zsh/site-functions/_asdf" ] && ! tail -n 5 "$HOMEBREW_PREFIX/share/zsh/site-functions/_asdf" | grep -q "p_a_t_c_h_e_d"; then
		patch "$(readlink -f "$HOMEBREW_PREFIX/share/zsh/site-functions/_asdf")" < "$DOTFILES_DIR/asdf_zsh_completition.patch"
	fi
fi

if [ -d "${ASDF_DATA_DIR}/plugins/java" ]; then
	if [ -e "${ASDF_DATA_DIR}/plugins/java/set-java-home.zsh" ]; then
		######This is a fix for https://github.com/halcyon/asdf-java/issues/244
		if [ $(uname -a | grep -ci Darwin) = 1 ] && ! tail -n 5 "$HOMEBREW_PREFIX/share/zsh/site-functions/_asdf" | grep -q "p_a_t_c_h_e_d"; then
			patch "${ASDF_DATA_DIR}/plugins/java/set-java-home.zsh" < "$DOTFILES_DIR/asdf_set-java-home.zsh.patch"
		fi
		source "${ASDF_DATA_DIR}/plugins/java/set-java-home.zsh"
	fi
fi
	
asdf() {
	echo "${0:A:h}"
	if [[ ( $(uname -a | grep -ci Darwin) = 1 ) && ( $1 == "install" || $2 == "python" ) ]]; then
		export CFLAGS="-I$(brew --prefix xz)/include" 
		export LDFLAGS="-L$(brew --prefix xz)/lib"
	fi
	# Call the real asdf
	command asdf "$@"
	local exit_code=$?

	# If first arg is install or reshim, and second is nodejs or python
	if [[ ( $1 == "install" || $1 == "reshim" ) && ( $2 == "nodejs" || $2 == "python" ) ]]; then
		
		# If asdf failed, return its exit code
		if [[ $exit_code -ne 0 ]]; then
			return $exit_code
		fi
		
		if [[ $2 == "nodejs" ]]; then
			if [[ ! -e "${ASDF_DATA_DIR}/shims/nodejs" ]]; then
				ln -sfn "${ASDF_DATA_DIR}/shims/node" "${ASDF_DATA_DIR}/shims/nodejs"
			fi
		fi

		if [[ $2 == "python" ]]; then

			if [[ ! -e "${ASDF_DATA_DIR}/shims/python" || ! -L "${ASDF_DATA_DIR}/shims/python" ]]; then
				ln -sfn "${ASDF_DATA_DIR}/shims/python3" "${ASDF_DATA_DIR}/shims/python"
			fi

			if [[ ! -e "${ASDF_DATA_DIR}/shims/pip" || ! -L "${ASDF_DATA_DIR}/shims/pip" ]]; then
				ln -sfn "${ASDF_DATA_DIR}/shims/pip3" "${ASDF_DATA_DIR}/shims/pip"
			fi
		fi
	fi

	if [[ ( $1 == "plugin") && ( $3 == "java") ]]; then

		# If asdf failed, return its exit code
		if [[ $exit_code -ne 0 ]]; then
			return $exit_code
		fi

		if [ -e "${ASDF_DATA_DIR}/plugins/java/set-java-home.zsh" ]; then
			######This is a fix for https://github.com/halcyon/asdf-java/issues/244
			if [ $(uname -a | grep -ci Darwin) = 1 ] && ! tail -n 5 "$HOMEBREW_PREFIX/share/zsh/site-functions/_asdf" | grep -q "p_a_t_c_h_e_d"; then
				patch "${ASDF_DATA_DIR}/plugins/java/set-java-home.zsh" < "$DOTFILES_DIR/asdf_set-java-home.zsh.patch"
			fi
			source "${ASDF_DATA_DIR}/plugins/java/set-java-home.zsh"
		fi
	fi

	return $exit_code
}

#and comment for maven $HOME/.asdf/plugins/maven/bin

