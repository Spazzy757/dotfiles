# =============================================================================
# Shell
# =============================================================================

export BASH_SILENCE_DEPRECATION_WARNING=1

# History — longer scrollback, no duplicates, append across sessions
export HISTSIZE=10000
export HISTFILESIZE=20000
HISTCONTROL=ignoredups:erasedups
shopt -s histappend
export PROMPT_COMMAND='history -a'

# =============================================================================
# Bash-it
# =============================================================================

if [[ -d $HOME/.bash_it ]]; then
    export BASH_IT=$HOME/.bash_it
    export BASH_IT_THEME=$HOME/.spazzy757.theme.bash
    unset MAILCHECK
    export IRC_CLIENT='irssi'
    export TODO="t"
    export SCM_CHECK=true
    export SHORT_HOSTNAME=$(hostname -s)
    source $BASH_IT/bash_it.sh
fi

# =============================================================================
# PATH
# =============================================================================

# Add a dir to PATH only if it exists and isn't already present — avoids the
# duplicate/dead entries you get when this file is sourced more than once.
_prepend_path() { [ -d "$1" ] && case ":$PATH:" in *":$1:"*) ;; *) PATH="$1:$PATH" ;; esac; }
_append_path()  { [ -d "$1" ] && case ":$PATH:" in *":$1:"*) ;; *) PATH="$PATH:$1" ;; esac; }

_prepend_path /usr/local/sbin
_prepend_path /usr/local/opt/curl/bin
_prepend_path "$HOME/.local/bin"
_prepend_path "$HOME/.cargo/bin"
_prepend_path "$HOME/.poetry/bin"
_prepend_path "$HOME/.krew/bin"
_prepend_path "$HOME/.kubectx"
_prepend_path "$HOME/.jenv/bin"

export GOPATH=$HOME/go
export BUN_INSTALL="$HOME/.bun"
_append_path "$HOME/.linkerd2/bin"
_append_path /usr/local/go/bin
_append_path "$GOPATH/bin"
_prepend_path "$BUN_INSTALL/bin"
export PATH

# =============================================================================
# Languages
# =============================================================================

# Python — shims on PATH up front; pyenv init deferred to first use to avoid slow startup
export PYENV_ROOT="$HOME/.pyenv"
_prepend_path "$PYENV_ROOT/shims"
_prepend_path "$PYENV_ROOT/bin"
unset -f _prepend_path _append_path
if command -v pyenv 1>/dev/null 2>&1; then
    pyenv() {
        unset -f pyenv
        eval "$(command pyenv init - --no-rehash)"  # --no-rehash skips a ~200ms shim rebuild
        pyenv "$@"
    }
fi
export GIT_INTERNAL_GETTEXT_TEST_FALLBACKS=1  # suppress gettext.sh warning from pyenv

# Rust
. "$HOME/.cargo/env"

# Java
if command -v jenv 1>/dev/null 2>&1; then
    eval "$(jenv init -)"
fi

# JavaScript — NVM lazy loaded on first use to avoid slow shell startup
export NVM_DIR="$HOME/.nvm"
_load_nvm() {
  unset -f nvm node npm npx yarn pnpm
  [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
  [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"
}
nvm()  { _load_nvm; nvm  "$@"; }
node() { _load_nvm; node "$@"; }
npm()  { _load_nvm; npm  "$@"; }
npx()  { _load_nvm; npx  "$@"; }
yarn() { _load_nvm; yarn "$@"; }
pnpm() { _load_nvm; pnpm "$@"; }

# =============================================================================
# Completions
# =============================================================================

# Cache completions by binary mtime — avoids a subprocess on every shell open
_cache_completion() {
  local name="$1" cache="$HOME/.cache/${1}-completion.bash"
  local bin; bin=$(command -v "$name" 2>/dev/null) || return
  if [ ! -f "$cache" ] || [ "$bin" -nt "$cache" ]; then
    mkdir -p "$HOME/.cache"
    shift; "$@" > "$cache" 2>/dev/null || rm -f "$cache"
  fi
  [ -f "$cache" ] && source "$cache"
}
_cache_completion kubectl kubectl completion bash
_cache_completion scw     scw autocomplete script shell=bash
_cache_completion stern   stern --completion=bash
unset -f _cache_completion

complete -o default -F __start_kubectl k
complete -C /usr/bin/terraform terraform

# macOS — Homebrew git completion
if command -v brew 1>/dev/null 2>&1; then
  [ -f "$(brew --prefix)/etc/bash_completion.d/git-completion.bash" ] && \
    . "$(brew --prefix)/etc/bash_completion.d/git-completion.bash"
fi

[ -f /usr/local/etc/bash_completion ]                 && . /usr/local/etc/bash_completion
[ -f $HOME/.git-completion.bash ]                     && source $HOME/.git-completion.bash
[ -f $HOME/.minikube.completion.sh ]                  && source $HOME/.minikube.completion.sh
[ -f $HOME/.fzf.bash ]                                && source $HOME/.fzf.bash
[ -f /usr/share/doc/fzf/examples/key-bindings.bash ]  && source /usr/share/doc/fzf/examples/key-bindings.bash

export FZF_COMPLETION_OPTS='--border --info=inline'

# Google Cloud SDK
[ -f $HOME/google-cloud-sdk/path.bash.inc ]       && . $HOME/google-cloud-sdk/path.bash.inc
[ -f $HOME/google-cloud-sdk/completion.bash.inc ] && . $HOME/google-cloud-sdk/completion.bash.inc
export USE_GKE_GCLOUD_AUTH_PLUGIN=True

# =============================================================================
# Editor
# =============================================================================

export VISUAL=nvim
export EDITOR="$VISUAL"
export VIMINIT="source $HOME/.config/nvim/init.lua"

# =============================================================================
# Misc
# =============================================================================

export DOCKER_BUILDKIT=1

[ -f $HOME/.aliases ]   && source $HOME/.aliases
[ -f $HOME/.protected ] && source $HOME/.protected
