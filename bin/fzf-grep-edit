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

if ! has rg; then
  fail "Can't find rg - install ripgrep and try again."
fi

if has bat; then
  fzf-grep-edit(){
    if [[ $# == 0 ]]; then
      echo 'Error: search term was not provided.'
      return
    fi
    match=$(
      rg --color=never --line-number "$1" |
        fzf --no-multi --delimiter : \
          --preview "bat --color=always --line-range {2}: {1}"
      )
    file=$(echo "$match" | cut -d':' -f1)
    if [[ -n $file ]]; then
    # shellcheck disable=SC2046
      $EDITOR "$file" +$(echo "$match" | cut -d':' -f2)
    fi
  }
else
  fzf-grep-edit(){
    if [[ $# == 0 ]]; then
      echo 'Error: search term was not provided.'
      return
    fi
    match=$(
      rg --color=never --line-number "$1" |
        fzf --no-multi --delimiter : \
          --preview "head -100 {2}: {1}"
      )
    file=$(echo "$match" | cut -d':' -f1)
    if [[ -n $file ]]; then
    # shellcheck disable=SC2046
      $EDITOR "$file" +$(echo "$match" | cut -d':' -f2)
    fi
  }
fi
# shellcheck disable=SC2068
fzf-grep-edit $@