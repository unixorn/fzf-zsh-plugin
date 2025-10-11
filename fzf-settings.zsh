# Setup fzf
# ---------
if [[ ! "$PATH" == *${FZF_PATH}/bin* ]]; then
  export PATH="$PATH:${FZF_PATH}/bin"
fi

function _fzf_settings_has() {
  which "$@" > /dev/null 2>&1
}

if _fzf_settings_has brew; then
  # If fzf was installed via brew, use the brew paths
  if [[ -x "$(brew --prefix)/bin/fzf" ]]; then
    if [[ -f "$(brew --prefix fzf)/shell/completion.zsh" ]]; then
      source "$(brew --prefix fzf)/shell/completion.zsh" 2> /dev/null
    fi
    if [[ -f "$(brew --prefix fzf)/shell/key-bindings.zsh" ]]; then
      source "$(brew --prefix fzf)/shell/key-bindings.zsh"
    fi
  fi
fi

# Auto-completion
# ---------------
if [[ -f "${FZF_PATH}/shell/completion.zsh" ]]; then
  [[ $- == *i* ]] && source "${FZF_PATH}/shell/completion.zsh" 2> /dev/null
fi

# Key bindings
# ------------
if [[ -f "${FZF_PATH}/shell/key-bindings.zsh" ]]; then
  source "${FZF_PATH}/shell/key-bindings.zsh"
fi

# Cleanup internal functions
unset -f _fzf_settings_has
