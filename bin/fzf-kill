#!/usr/bin/env bash
#
# Original source: https://bluz71.github.io/2018/11/26/fuzzy-finding-in-bash-with-fzf.html

set -o pipefail
if [[ -n "$DEBUG" ]]; then
  set -x
fi

fzf-kill() {
  local pid_col
  local pids

  if [[ $(uname) = Linux ]]; then
    pid_col=2
    pids=$(
      ps -f -u "$USER" | sed 1d | fzf --multi | tr -s "[:blank:]" | cut -d' ' -f"$pid_col"
    )
  elif [[ $(uname) = Darwin ]]; then
    pid_col=3;
    pids=$(
      ps -f -u "$USER" | sed 1d | fzf --multi | tr -s "[:blank:]" | cut -d' ' -f"$pid_col"
    )
  elif [[ $(uname) = FreeBSD ]]; then
    pid_col=2
    pids=$(
      ps -axu -U "$USER" | sed 1d | fzf --multi | tr -s "[:blank:]" | cut -d' ' -f"$pid_col"
    )
  else
    echo 'Error: unknown platform'
    return
  fi

  if [[ -n "$pids" ]]; then
    echo "$pids" | xargs kill -9 "$@"
  fi
}

# shellcheck disable=SC2068
fzf-kill $@