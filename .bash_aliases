# Kubernetes
alias k="kubectl"

# Git
alias gits="git status"
alias gitc="git commit -S -m"
alias gitp="git push origin $(git branch --show-current)"

# Terraform
alias tf="terraform"

# Directories
alias repos="cd ~/Documents"


# Misc
alias ls='ls -GFh'

function kuswitchns { kubectl config set-context $(kubectl config current-context) --namespace="$1"; }
export -f kuswitchns
