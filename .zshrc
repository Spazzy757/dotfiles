# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH
# Path to your oh-my-zsh installation.
export ZSH="/Users/spazzy/.oh-my-zsh"
source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
PATH="/usr/local/opt/ed/libexec/gnubin:$PATH"
export TERM="xterm-256color"

# GIT
alias gits="git status"
alias gitc="git commit -S -m"
#alias push-branch="git push origin $(git branch | grep \* | cut -d ' ' -f2)"
alias gmaster="git checkout master"

# Directories
alias vuma="cd ~/Documents/vumatel"
alias school="cd ~/Documents/school"
alias personal="cd ~/Documents/spazzy"
alias tangent="cd ~/Documents/tangent"
alias appointmentguru="cd ~/Documents/appointmentguru"
alias go-personal="cd  /Users/spazzy/go/src/github.com/Spazzy757"
alias notebooks="cd ~/Documents/Notebooks"
alias cs="cd ~/Documents/container-solutions"
alias ling="cd ~/Documents/linguine"
alias yara="cd ~/Documents/yara"

# Exports
export GOPATH=$HOME/go
export PATH=$PATH:$GOPATH/bin
export GO111MODULE=on
export PATH="/Applications/Postgres.app/Contents/Versions/latest/bin:$PATH"
PATH=~/anaconda3/bin:$PATH
export PATH=$PATH:/usr/local/kubebuilder/bin


# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="powerlevel9k/powerlevel9k"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in ~/.oh-my-zsh/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to automatically update without prompting.
# DISABLE_UPDATE_PROMPT="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS=true

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in ~/.oh-my-zsh/plugins/*
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
ZSH_THEME="powerlevel9k/powerlevel9k"

# POWERLEVEL SETTINGS
POWERLEVEL9K_MODE="nerdfont-complete"
POWERLEVEL9K_PROMPT_ADD_NEWLINE=true
POWERLEVEL9K_VCS_GIT_ICON='\uf296'
POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(custom_elementary_icon dir newline vcs)
POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(kubecontext ram disk_usage command_execution_time)


# User with skull
user_with_skull() {
    echo -n "\ufb8a $(whoami)"
}

POWERLEVEL9K_CUSTOM_ELEMENTARY_ICON="user_with_skull  `whoami` "

POWERLEVEL9K_VCS_GIT_GITHUB_ICON=$'\uF408 '

ZSH_DISABLE_COMPFIX=true
plugins=(
  git
#  iterm2
#  macports
#  man
#  osx
  zsh-syntax-highlighting
  zsh-autosuggestions
)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
PATH="/usr/local/opt/gnu-indent/libexec/gnubin:$PATH"
PATH="/usr/local/opt/gnu-sed/libexec/gnubin:$PATH"
PATH="/usr/local/opt/gnu-tar/libexec/gnubin:$PATH"
PATH="/usr/local/opt/gnu-which/libexec/gnubin:$PATH"
PATH="/usr/local/opt/grep/libexec/gnubin:$PATH"
export PATH=$PATH:/usr/local/kubebuilder/bin

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/spazzy/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/spazzy/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/spazzy/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/spazzy/google-cloud-sdk/completion.zsh.inc'; fi
