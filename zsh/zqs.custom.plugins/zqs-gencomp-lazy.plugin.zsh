#!/usr/bin/env zsh
# Generate getopt-style completions only when gencomp is explicitly invoked.

[[ -n ${GENCOMPL_FPATH:-} ]] || typeset -g GENCOMPL_FPATH="$HOME/.zsh/complete"
fpath+=("$GENCOMPL_FPATH")
typeset -gU fpath

gencomp() {
  emulate -L zsh

  if (( $# == 0 )) || [[ $1 == -h || $1 == --help ]]; then
    print -r -- 'Usage: gencomp program [argument-for-help-text]'
    return 1
  fi

  local program=$1
  local help_arg=${2:---help}
  local generator_dir="${ZGEN_DIR:-$HOME/.zgenom}/RobSis/zsh-completion-generator/___"
  local parser="$generator_dir/help2comp.py"
  local python_bin=${commands[python3]:-${commands[python]:-}}
  local output_file="$GENCOMPL_FPATH/_$program"
  local -a pipeline_status

  if [[ -z ${commands[$program]:-} ]]; then
    print -u2 -r -- "gencomp: command not found: $program"
    return 127
  fi
  if [[ ! -r $parser ]]; then
    print -u2 -r -- "gencomp: parser not found: $parser"
    print -u2 -r -- 'Run zqs update-plugins to restore the completion-generator checkout.'
    return 1
  fi
  if [[ -z $python_bin ]]; then
    print -u2 -r -- 'gencomp: python3 or python is required'
    return 1
  fi

  mkdir -p "$GENCOMPL_FPATH" || return
  "$program" "$help_arg" 2>&1 | "$python_bin" "$parser" "$program" >! "$output_file"
  pipeline_status=("${pipestatus[@]}")

  if (( pipeline_status[2] != 0 )); then
    rm -f "$output_file"
    print -u2 -r -- "gencomp: no options found in '$program $help_arg'"
    return ${pipeline_status[2]}
  fi

  autoload -Uz "_$program"
  (( $+functions[compdef] )) && compdef "_$program" "$program"
  print -r -- "Generated completion: $output_file"
}
