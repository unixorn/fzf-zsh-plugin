#!/usr/bin/env bash
#
# fif
#
# Source - https://betterprogramming.pub/boost-your-command-line-productivity-with-fuzzy-finder-985aa162ba5d

set -o pipefail
if [[ -n "$DEBUG" ]]; then
  set -x
fi

fif() {
  if [ ! "$#" -gt 0 ]; then
    echo "Need a string to search for!";
    return 1;
  fi
  # if FZF_PREVIEW_WINDOW is undefined, quoting it breaks the script
  # shellcheck disable=SC2086
  rg --files-with-matches --no-messages "$1" | fzf --preview-window "$FZF_PREVIEW_WINDOW" --preview "rg --ignore-case --pretty --context 10 '$1' {}"
}

[[ -z "$FZF_PREVIEW_WINDOW" ]] && export FZF_PREVIEW_WINDOW=':hidden'

command -v rg >/dev/null
# shellcheck disable=SC2181
if [[ $? -eq 0 ]]; then
  # shellcheck disable=SC2068
  fif $@
else
  echo "Can't find ripgrep (rg). Please install it"
  exit 1
fi
