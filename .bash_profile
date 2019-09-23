if [ -f `brew --prefix`/etc/bash_completion.d/git-completion.bash ]; then
  . `brew --prefix`/etc/bash_completion.d/git-completion.bash
fi

# added by Anaconda3 5.2.0 installer
export PATH="/anaconda3/bin:$PATH"
source ~/.profile

# added by Anaconda3 5.2.0 installer
export PATH="/Users/spazzy/anaconda3/bin:$PATH"

# added by Miniconda3 installer
export PATH="/Users/spazzy/miniconda3/bin:$PATH"
export ANDROID_HOME=/usr/local/share/android-sdk
export JAVA_HOME=/Library/Java/Home

# added by Miniconda3 4.5.11 installer
export PATH="/miniconda3/bin:$PATH"

# added by Miniconda3 installer
export PATH="/Users/spazzy/miniconda3/bin:$PATH"
# added by Anaconda3 5.3.1 installer
# >>> conda init >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$(CONDA_REPORT_ERRORS=false '/anaconda3/bin/conda' shell.bash hook 2> /dev/null)"
if [ $? -eq 0 ]; then
    \eval "$__conda_setup"
else
    if [ -f "/anaconda3/etc/profile.d/conda.sh" ]; then
        . "/anaconda3/etc/profile.d/conda.sh"
        CONDA_CHANGEPS1=false conda activate base
    else
        \export PATH="/anaconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda init <<<

# added by Miniconda3 4.5.11 installer
export PATH="/miniconda3/bin:$PATH"
. /Users/spazzy/miniconda3/etc/profile.d/conda.sh

export PATH="$HOME/.poetry/bin:$PATH"
function kuswitchns { kubectl config set-context $(kubectl config current-context) --namespace="$1"; }
export -f kuswitchns
export PATH=$PATH:$HOME/.linkerd2/bin
export PS1='\[\033[0;32m\]\[\033[0m\033[0;32m\]\u\[\033[0;36m\] @ \[\033[0;36m\]\h \w\[\033[0;32m\]$(__git_ps1)\n\[\033[0;32m\]└─\[\033[0m\033[0;32m\] \$\[\033[0m\033[0;32m\] ▶\[\033[0m\] '
export LSCOLORS=ExFxBxDxCxegedabagacad
source ~/.git-prompt.sh
