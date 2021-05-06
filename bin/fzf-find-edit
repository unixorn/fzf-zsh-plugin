#!/usr/bin/env bash
#
# Original source: https://bluz71.github.io/2018/11/26/fuzzy-finding-in-bash-with-fzf.html

set -o pipefail
if [[ -n "$DEBUG" ]]; then
  set -x
fi

fail() {
  printf '%s\n' "$1" >&2  ## Send message to stderr. Exclude >&2 if you don't want it that way.
  exit "${2-1}"  ## Return a code specified by $2 or 1 by default.
}

has() {
  which "$@" > /dev/null 2>&1
}

# Functions from https://bluz71.github.io/2018/11/26/fuzzy-finding-in-bash-with-fzf.html
if has bat; then
  fzf-find-edit() {
    file=$(
      fzf --query="$1" --no-multi --select-1 --exit-0 \
        --preview 'bat --color=always --line-range :500 {}'
      )
    if [[ -n "$file" ]]; then
      $EDITOR "$file"
    fi
  }
else
  # No bat installed, so use head
  fzf-find-edit() {
    file=$(
      fzf --query="$1" --no-multi --select-1 --exit-0 \
        --preview 'head -100 {}'
      )
    if [[ -n "$file" ]]; then
      $EDITOR "$file"
    fi
  }
fi

# shellcheck disable=SC2068
fzf-find-edit $@