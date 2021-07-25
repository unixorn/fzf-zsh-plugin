#!/usr/bin/env zsh
#
# Original Author: Mark Nielsen
# Original source: https://polothy.github.io/post/2019-08-19-fzf-git-checkout/

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

in_git_repo() {
  git rev-parse HEAD > /dev/null 2>&1
}

if ! in_git_repo; then
  fail "Not in a git repository"
fi

if ! has fzf; then
  fail "Can't find fzf in your PATH"
fi

if ! has git; then
  fail "Can't find git in your PATH"
fi

function fzf-git-branch(){
    git rev-parse HEAD > /dev/null 2>&1 || return

    # shellcheck disable=SC2016
    git branch --color=always --all --sort=-committerdate |
        grep -v HEAD |
        fzf --height 50% --ansi --no-multi --preview-window right:65% \
            --preview 'git log -n 50 --color=always --date=short --pretty="format:%C(auto)%cd %h%d %s" $(sed "s/.* //" <<< {})' |
        sed "s/.* //"
}

# shellcheck disable=SC2068
fzf-git-branch $@