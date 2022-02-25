#!/usr/bin/env bash
#
# Stop a docker container
#
# From fzf wiki

set -o pipefail
if [[ -n "$DEBUG" ]]; then
  set -x
fi

function debug() {
  if [[ -n "$DEBUG" ]]; then
    echo "$@"
  fi
}

function fail() {
  printf '%s\n' "$1" >&2  ## Send message to stderr. Exclude >&2 if you don't want it that way.
  exit "${2-1}"  ## Return a code specified by $2 or 1 by default.
}

function has() {
  # Check if a command is in $PATH
  which "$@" > /dev/null 2>&1
}

# Select a running docker container to stop
function d-stop-container() {
  local cid
  cid=$(docker ps | sed 1d | fzf -q "$1" | awk '{print $1}')

  [ -n "$cid" ] && docker stop "$cid"
}

if has docker; then
  d-stop-container "$@"
else
  "Cannot find docker in $PATH"
fi