#!/usr/bin/env zsh
if [[ "$(uname -s)" == "Linux" ]]; then
	path=("${ASDF_DATA_DIR:-$HOME/.asdf}/bin" $path)
fi
