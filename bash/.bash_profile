# Silence Warning about ZSH
export BASH_SILENCE_DEPRECATION_WARNING=1

# Bash IT Setup
if [[ -d $HOME/.bash-it ]];
then
    # Path to the bash it configuration
    export BASH_IT=$HOME/.bash-it

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
# Make sure to use pyenv when in terminal
if command -v pyenv 1>/dev/null 2>&1; then
    eval "$(pyenv init -)"
fi

# Bash git setup
# Silence the gettext.sh warning
# from using .pyenv
export GIT_INTERNAL_GETTEXT_TEST_FALLBACKS=1
if [ -f `brew --prefix`/etc/bash_completion.d/git-completion.bash ];
then
    . `brew --prefix`/etc/bash_completion.d/git-completion.bash
fi

# Added Super Bin to Path
export PATH=/usr/local/sbin:$PATH

# Curl
export PATH=/usr/local/opt/curl/bin:$PATH

# Rust
export PATH=$HOME/.cargo/bin:$PATH

# Kubernetes
source $HOME/.minikube.completion.sh
export PATH=$PATH:$HOME/.linkerd2/bin
export PATH="$HOME/.krew/bin:$PATH"
source <(stern --completion=bash)

# Golang
export GOPATH=$HOME/go
export PATH=$PATH:$GOPATH/bin

# Java
export JAVA_8_HOME=$(/usr/libexec/java_home -v1.8)
export JAVA_11_HOME=$(/usr/libexec/java_home -v11)

# Docker
export DOCKER_BUILDKIT=1

# Ruby
export PATH=$HOME/.gem/ruby/X.X.0/bin:$PATH

# Google Cloud SDK settings
if [ -f $HOME/google-cloud-sdk/path.bash.inc ];
then
    . $HOME/google-cloud-sdk/path.bash.inc;
fi

if [ -f $HOME/google-cloud-sdk/completion.bash.inc ];
then
    . $HOME/google-cloud-sdk/completion.bash.inc;
fi

# Load Aliases
if [[ -f $HOME/.aliases ]];
then
    source $HOME/.aliases
fi
# Load settings with secrets
if [[ -f $HOME/.protected ]];
then
    source $HOME/.protected
fi

