# Copyright 2020-2025 Joseph Block <jpb@unixorn.net>
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

# Add our plugin's bin directory to the user's path
local FZF_PLUGIN_BIN="${0:h}/bin"
if [[ ! "$path" == *${FZF_PLUGIN_BIN}* ]]; then
  path+=(${FZF_PLUGIN_BIN})
fi
unset FZF_PLUGIN_BIN

local FZF_COMPLETIONS_D="$(dirname $0)/completions"
if [[ -d "$FZF_COMPLETIONS_D" ]]; then
  export fpath=($FZF_COMPLETIONS_D "${fpath[@]}" )
fi
unset FZF_COMPLETIONS_D

function _fzf_has() {
  which "$@" > /dev/null 2>&1
}

function _fzf_debugOut() {
  if [[ -n "$DEBUG" ]]; then
    echo "$@"
  fi
}

# Install fzf, and enable it for command line history searching and
# file searching.

# Determine where fzf is installed
local fzf_conf
if [[ -z "$FZF_PATH" ]]; then
  FZF_PATH=~/.fzf
  fzf_conf=~/.fzf.zsh
else
  fzf_conf="$FZF_PATH/fzf.zsh"
fi
unset xdg_path

# Install fzf into ~ if it hasn't already been installed.
if ! _fzf_has fzf; then
  if [[ ! -d $FZF_PATH ]]; then
    git clone --depth 1 https://github.com/junegunn/fzf.git $FZF_PATH
    $FZF_PATH/install --bin
  fi
fi

# Install some default settings if user doesn't already have fzf
# settings configured.
_fzf_debugOut "fzf_conf: $fzf_conf"
if [[ ! -f $fzf_conf ]]; then
  echo "Can't find a fzf configuration file at $fzf_conf, creating a default one"
  cp "$(dirname $0)/fzf-settings.zsh" $fzf_conf
fi

# Source this before we start examining things so we can override the
# defaults cleanly.
[[ -f $fzf_conf ]] && source $fzf_conf
unset fzf_conf

# Reasonable defaults. Exclude .git directory and the node_modules cesspit.
# Don't step on user's FZF_DEFAULT_COMMAND
if [[ -z "$FZF_DEFAULT_COMMAND" ]]; then
  export FZF_DEFAULT_COMMAND='find . -type f -not \( -path "*/.git/*" -o -path "./node_modules/*" \)'
  export FZF_ALT_C_COMMAND='find . -type d ( -path .git -o -path node_modules ) -prune'

  if _fzf_has rg; then
    # rg is faster than find, so use it instead.
    export FZF_DEFAULT_COMMAND='rg --files --hidden --follow --glob "!{.git,node_modules}/**"'
  fi

  # If fd command is installed, use it instead of find
  _fzf_has 'fd' && _fd_cmd="fd"
  _fzf_has 'fdfind' && _fd_cmd="fdfind"
  if [[ -n "$_fd_cmd" ]]; then
    # Show hidden, and exclude .git and the pigsty node_modules files
    export FZF_DEFAULT_COMMAND="$_fd_cmd --hidden --follow --exclude '.git' --exclude 'node_modules'"
    export FZF_ALT_C_COMMAND="$FZF_DEFAULT_COMMAND --type d"

    _fzf_compgen_dir() {
      eval "$FZF_ALT_C_COMMAND . \"$1\""
    }

    _fzf_compgen_path() {
      eval "$FZF_DEFAULT_COMMAND . \"$1\""
    }
  fi
  unset _fd_cmd
fi

# Return one of the following preview commands:
#   - A basic foolproof preview that will rely on available tools or use fallbacks like `cat`.
#   - An advanced preview using a `less` preprocessor, capable of showing a wide range of formats, incl. images, dirs,
#     CSVs, and other binary files (depending on available tooling).
_fzf_preview() {
  _fzf_preview_pager='cat'
  foolproofPreview='cat {}'
  if _fzf_has bat; then
    _fzf_preview_pager='bat'
    foolproofPreview='([[ -f {} ]] && (bat --style=numbers --color=always {} || cat {})) || ([[ -d {} ]] && (tree -C {} | less)) || echo {} 2>/dev/null | head -n 200'
  fi
  if _fzf_has batcat; then
    _fzf_preview_pager='batcat'
    foolproofPreview='([[ -f {} ]] && (batcat --style=numbers --color=always {} || cat {})) || ([[ -d {} ]] && (tree -C {} | less)) || echo {} 2>/dev/null | head -n 200'
  fi
  local preview
  [[ "$FZF_PREVIEW_ADVANCED" == true ]] \
    && preview="lessfilter-fzf {}" \
    || preview="$foolproofPreview"
  echo "$preview"
}

# Don't step on user's defined variables. Export to potentially leverage them by other scripts.
[[ -z "$FZF_COLOR_SCHEME" ]]   && export FZF_COLOR_SCHEME="--color='hl:148,hl+:154,pointer:032,marker:010,bg+:237,gutter:008'"
[[ -z "$FZF_PREVIEW" ]]        && export FZF_PREVIEW="$(_fzf_preview)"
[[ -z "$FZF_PREVIEW_WINDOW" ]] && export FZF_PREVIEW_WINDOW=':hidden'
if [[ -z "$FZF_DEFAULT_OPTS" ]]; then
  fzf_default_opts+=(
    "--layout=reverse"
    "--info=inline"
    "--height=80%"
    "--multi"
    "--preview='${FZF_PREVIEW}'"
    "--preview-window='${FZF_PREVIEW_WINDOW}'"
    "$FZF_COLOR_SCHEME"
    "--prompt='∼ '"
    "--pointer='▶'"
    "--marker='✓'"
    "--bind '?:toggle-preview'"
    "--bind 'ctrl-a:select-all'"
    "--bind 'ctrl-e:execute(vim {+} >/dev/tty)'"
    "--bind 'ctrl-v:execute(code {+})'"
  )
  if _fzf_has pbcopy; then
    # On macOS, make ^Y yank the selection to the system clipboard. On Linux you can alias pbcopy to `xclip -selection clipboard` or corresponding tool.
    fzf_default_opts+=("--bind 'ctrl-y:execute-silent(echo {+} | pbcopy)'")
  fi
  export FZF_DEFAULT_OPTS=$(printf '%s\n' "${fzf_default_opts[@]}")
fi

if _fzf_has tree; then
  function fzf-change-directory() {
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

if [[ -d $FZF_PATH/man ]]; then
    manpath+=(":$FZF_PATH/man")
fi

if _fzf_has z && ! _fzf_has zoxide; then
  unalias z 2> /dev/null
  _fzf_z="_z"
  (( ${+functions[zshz]} )) && { _fzf_z="zshz"; compdef _zshz z; }
  # like normal z when used with arguments but displays an fzf prompt when used without.
  function z() {
    [ $# -gt 0 ] && $_fzf_z "$*" && return
    cd "$($_fzf_z -l 2>&1 | fzf --height 40% --nth 2.. --reverse --inline-info +s --tac --query "${*##-* }" | sed 's/^[0-9,.]* *//')"
  }
fi

export FZF_CTRL_T_COMMAND="${FZF_DEFAULT_COMMAND}"

# From fzf wiki
# cdf - cd into the directory of the selected file
function cdf() {
  local file
  local dir
  file=$(fzf +m -q "$1") && dir=$(dirname "$file") && cd "$dir"
}

if _fzf_has pbcopy; then
  if _fzf_has ghead; then
    function falias {
        # Search alias by key or values
        local out
        out=$(alias | fzf)
        echo -n "$(echo -n "${out}" | cut -d= -f2 | ghead -c -1 | pbcopy)"
    }
  fi
fi

# Cleanup internal functions
unset -f _fzf_debugOut
unset -f _fzf_has
unset -f _fzf_preview
