# Silence Warning about ZSH
export BASH_SILENCE_DEPRECATION_WARNING=1

# Set term
export TERM="screen-256color-bce"

# Setup hostroy to be longer
export HISTSIZE=10000
export HISTFILESIZE=20000
shopt -s histappend
export PROMPT_COMMAND='history -a'

# Bash IT Setup
if [[ -d $HOME/.bash_it ]];
then
    # Path to the bash it configuration
    export BASH_IT=$HOME/.bash_it

    # Lock and Load a custom theme file.
    # Leave empty to disable theming.
    # location /.bash_it/themes/
    export BASH_IT_THEME=$HOME/.spazzy757.theme.bash

    # (Advanced): Change this to the name of your remote repo if you
    # cloned bash-it with a remote other than origin such as `bash-it`.
    # export BASH_IT_REMOTE='bash-it'

    # Don't check mail when opening terminal.
    unset MAILCHECK

    # Change this to your console based IRC client of choice.
    export IRC_CLIENT='irssi'

    # Set this to the command you use for todo.txt-cli
    export TODO="t"

    # Set this to false to turn off version control status checking within the prompt for all themes
    export SCM_CHECK=true

    # Set Xterm/screen/Tmux title with only a short hostname.
    # Uncomment this (or set SHORT_HOSTNAME to something else),
    # Will otherwise fall back on $HOSTNAME.
    export SHORT_HOSTNAME=$(hostname -s)

    # Set Xterm/screen/Tmux title with only a short username.
    # Uncomment this (or set SHORT_USER to something else),
    # Will otherwise fall back on $USER.
    #export SHORT_USER=${USER:0:8}

    # Set Xterm/screen/Tmux title with shortened command and directory.
    # Uncomment this to set.
    #export SHORT_TERM_LINE=true

    # Set vcprompt executable path for scm advance info in prompt (demula theme)
    # https://github.com/djl/vcprompt
    #export VCPROMPT_EXECUTABLE=~/.vcprompt/bin/vcprompt

    # (Advanced): Uncomment this to make Bash-it reload itself automatically
    # after enabling or disabling aliases, plugins, and completions.
    # export BASH_IT_AUTOMATIC_RELOAD_AFTER_CONFIG_CHANGE=1
    # Uncomment this to make Bash-it create alias reload.
    # export BASH_IT_RELOAD_LEGACY=1

    # Load Bash It
    source $BASH_IT/bash_it.sh
fi

# Python
export PATH=$HOME/.poetry/bin:$PATH
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
# Make sure to use pyenv when in terminal
if command -v pyenv 1>/dev/null 2>&1; then
    eval "$(pyenv init -)"
fi

# Bash git setup
# Silence the gettext.sh warning
# from using .pyenv
export GIT_INTERNAL_GETTEXT_TEST_FALLBACKS=1
if command -v brew 1>/dev/null 2>&1; then
  [ -f `brew --prefix`/etc/bash_completion.d/git-completion.bash ] && 
    . `brew --prefix`/etc/bash_completion.d/git-completion.bash
fi

# Added Super Bin to Path
export PATH=/usr/local/sbin:$PATH

# Curl
export PATH=/usr/local/opt/curl/bin:$PATH

# Rust
export PATH=$HOME/.cargo/bin:$PATH
. "$HOME/.cargo/env"

# Kubernetes
[ -f $HOME/.minikube.completion.sh ] && source $HOME/.minikube.completion.sh
export PATH=$PATH:$HOME/.linkerd2/bin
export PATH="$HOME/.krew/bin:$PATH"
if command -v stern 1>/dev/null 2>&1; then
  source <(stern --completion=bash)
fi
export PATH=~/.kubectx:$PATH

# Golang
export GOPATH=$HOME/go
export PATH=$PATH:$GOPATH/bin

# JavaScript
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# Java
if command -v jenv 1>/dev/null 2>&1; then
  export PATH="$HOME/.jenv/bin:$PATH"
  eval "$(jenv init -)"
fi
# Docker
export DOCKER_BUILDKIT=1

# Ruby
export PATH=$HOME/.gem/ruby/X.X.0/bin:$PATH

# Google Cloud SDK settings
[ -f $HOME/google-cloud-sdk/path.bash.inc ] && 
  . $HOME/google-cloud-sdk/path.bash.inc
[ -f $HOME/google-cloud-sdk/completion.bash.inc ] && 
  . $HOME/google-cloud-sdk/completion.bash.inc
export USE_GKE_GCLOUD_AUTH_PLUGIN=True

# Load Aliases
[ -f $HOME/.aliases ] && source $HOME/.aliases

# Load Git Completion
[ -f $HOME/.git-completion.bash ] && source $HOME/.git-completion.bash

# Load settings with secrets
[ -f $HOME/.protected ] && source $HOME/.protected

# Load vimrc from a directroy
[ -f $HOME/.vim/.vimrc ] && export VIMINIT="source $HOME/.vim/.vimrc"

# Options to fzf command
export FZF_COMPLETION_OPTS='--border --info=inline'
[ -f $HOME/.fzf.bash ] && source $HOME/.fzf.bash
[ -f /usr/share/doc/fzf/examples/key-bindings.bash ] && 
  source /usr/share/doc/fzf/examples/key-bindings.bash

# bash completion
[ -f /usr/local/etc/bash_completion ] && 
  . /usr/local/etc/bash_completion

