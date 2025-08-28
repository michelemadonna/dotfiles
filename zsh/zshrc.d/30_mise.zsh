#!/usr/bin/env zsh


#This file is sourced by zshrc to set up mise integration.
(( ! $+commands[mise] )) && return
#is neeeded by powerlevel10k to show the mise segment using asdf segment configuration
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




asdf() {
	command mise "$@"
}


if whence -w _mise >/dev/null; then
	_mise 2>/dev/null
	functions[_mise_orig]=$functions[_mise]
fi

if whence -w _mise >/dev/null; then
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

