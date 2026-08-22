#!/usr/bin/env zsh
# zqs-async-updates.plugin.zsh owns the non-blocking Quickstart check.
if (( ${ZQS_DISABLE_QUICKSTART_SYNC_UPDATES:-0} )); then
  unset QUICKSTART_KIT_REFRESH_IN_DAYS
fi
