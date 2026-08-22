#!/usr/bin/env zsh
# Keep update checks and all network I/O out of the startup path.

typeset -gi ZQS_UPDATE_CHECK_HOURS=${ZQS_UPDATE_CHECK_HOURS:-24}
typeset -gi ZQS_PLUGIN_UPDATE_DAYS=${ZGEN_PLUGIN_UPDATE_DAYS:-7}
typeset -gi ZQS_ZGENOM_UPDATE_DAYS=${ZGEN_SYSTEM_UPDATE_DAYS:-7}
typeset -gi ZQS_QUICKSTART_UPDATE_DAYS=${QUICKSTART_KIT_REFRESH_IN_DAYS:-7}

# zgenom performs both receipt checks and updates in a disowned process after
# the first prompt. It also rebuilds init.zsh through the supported path when
# an update really changed something.
zgenom autoupdate \
  --self "$ZQS_ZGENOM_UPDATE_DAYS" \
  --plugin "$ZQS_PLUGIN_UPDATE_DAYS" \
  --silent

# Disable Quickstart's synchronous checker. Restore the setting from the
# one-shot precmd hook, after .zshrc has passed the checker.
unset QUICKSTART_KIT_REFRESH_IN_DAYS

_zqs_update_receipt_is_stale() {
  emulate -L zsh
  local receipt=$1
  local -i max_age=$2 last_update=0

  if [[ -r $receipt ]]; then
    IFS= read -r last_update < "$receipt"
    [[ $last_update == <-> ]] || last_update=0
  fi
  (( EPOCHSECONDS - last_update >= max_age ))
}

_zqs_run_quickstart_update() {
  emulate -L zsh
  local cache_dir=$1 lock_dir=$2

  {
    print -r -- "Quickstart update started: ${(%):-%D{%Y-%m-%d %H:%M:%S}}"
    if (( ${+functions[_update-zsh-quickstart]} )); then
      _update-zsh-quickstart
    fi
  } >| "$cache_dir/quickstart-update.log" 2>&1

  command rmdir "$lock_dir" 2>/dev/null
}

_zqs_schedule_quickstart_update() {
  emulate -L zsh
  autoload -Uz add-zsh-hook
  add-zsh-hook -d precmd _zqs_schedule_quickstart_update

  typeset -g QUICKSTART_KIT_REFRESH_IN_DAYS=$ZQS_QUICKSTART_UPDATE_DAYS
  zmodload zsh/datetime

  local cache_dir="${XDG_CACHE_HOME:-$HOME/.cache}/zsh/updates"
  local check_receipt="$cache_dir/quickstart-last-check"
  local update_receipt="${ZDOTDIR:-$HOME}/.zsh-quickstart-last-update"
  local lock_dir="$cache_dir/quickstart-lock"

  if ! _zqs_update_receipt_is_stale \
    "$check_receipt" $(( ZQS_UPDATE_CHECK_HOURS * 3600 )); then
    return 0
  fi

  [[ -d $cache_dir ]] || command mkdir -p "$cache_dir" || return
  command mkdir "$lock_dir" 2>/dev/null || return
  print -r -- "$EPOCHSECONDS" >| "$check_receipt"

  if _zqs_update_receipt_is_stale \
    "$update_receipt" $(( ZQS_QUICKSTART_UPDATE_DAYS * 86400 )); then
    _zqs_run_quickstart_update "$cache_dir" "$lock_dir" &!
  else
    command rmdir "$lock_dir" 2>/dev/null
  fi
}

autoload -Uz add-zsh-hook
add-zsh-hook precmd _zqs_schedule_quickstart_update
