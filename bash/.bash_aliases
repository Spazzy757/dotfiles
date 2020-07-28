# Misc
alias ls='ls -alFG'

# Kubernetes
alias k="kubectl"
## Function to quickly change to a namespace
function kns {
         kubectl config set-context $(kubectl config current-context) --namespace="$1";
}
export -f kns

# Git
alias gits="git status"
alias gitc="git commit -S -m"
function gitl {
         git log \
         --graph \
         --abbrev-commit \
         --decorate \
         --format=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' \
         --all
}
export -f gitl

# Terraform
alias tf="terraform"

# Directories
function repos {
      cd "$HOME/Documents/repos/$1/"
}
export -f repos
function csrepos {
      cd "$HOME/Documents/repos/container-solutions/$1/"
}
export -f csrepos


# Load Aliases with secrets
if [[ -f $HOME/.bash_protected ]];
then
  source $HOME/.bash_protected
fi

