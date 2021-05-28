# Copyright 2020-2021 Joseph Block <jpb@unixorn.net>
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

# Add our plugin's bin diretory to the user's path
local FZF_PLUGIN_BIN="$(dirname $0)/bin"
export PATH="${PATH}:${FZF_PLUGIN_BIN}"
unset FZF_PLUGIN_BIN

function has() {
  which "$@" > /dev/null 2>&1
}

# Install fzf, and enable it for command line history searching and
# file searching.

# Install fzf into ~ if it hasn't already been installed.
if ! has fzf; then
  if [[ ! -d ~/.fzf ]]; then
    git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
  fi
fi

# Install some default settings if user doesn't already have fzf
# settings configured.
if [[ ! -f ~/.fzf.zsh ]]; then
  cp "$(dirname $0)/fzf-settings.zsh" ~/.fzf.zsh
fi

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

export FZF_DEFAULT_OPTS='--extended'
export FZF_CTRL_T_COMMAND="${FZF_DEFAULT_COMMAND}"

# If fd command is installed, use it instead of find
if has 'fd'; then
  # export FZF_DEFAULT_COMMAND='fd --type f'
  
  # Show hidden, and exclude .git and the pigsty node_modules files
  export FZF_DEFAULT_COMMAND="fd --hidden --follow --exclude '.git' --exclude 'node_modules'"
  export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
  export FZF_ALT_C_COMMAND="$FZF_DEFAULT_COMMAND --type d"

  _fzf_compgen_dir() {
    fd --type d . "$1"
  }

  _fzf_compgen_path() {
    fd . "$1"
  }

fi

if has tree; then
  fzf-change-directory() {
    local directory=$(
      fd --type d | \
      fzf --query="$1" --no-multi --select-1 --exit-0 \
        --preview 'tree -C {} | head -100'
      )
    if [[ -n "$directory" ]]; then
      cd "$directory"
    fi
  }
  alias fcd=fzf-change-directory
fi

alias fkill='fzf-kill'

if [[ -d ~/.fzf/man ]]; then
  export MANPATH="$MANPATH:~/.fzf/man"
fi

if has z; then
  unalias z 2> /dev/null
  # like normal z when used with arguments but displays an fzf prompt when used without.
  z() {
    [ $# -gt 0 ] && _z "$*" && return
    cd "$(_z -l 2>&1 | fzf --height 40% --nth 2.. --reverse --inline-info +s --tac --query "${*##-* }" | sed 's/^[0-9,.]* *//')"
  }
fi

# From fzf wiki
# cdf - cd into the directory of the selected file
cdf() {
  local file
  local dir
  file=$(fzf +m -q "$1") && dir=$(dirname "$file") && cd "$dir"
}