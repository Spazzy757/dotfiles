# Kubernetes
alias k="kubectl"

function kuswitchns {
         kubectl config set-context $(kubectl config current-context) --namespace="$1";
}
export -f kuswitchns


# Git
alias gits="git status"
alias gitc="git commit -S -m"
alias gitp="git push origin $(git branch --show-current)"
alias gitl="git log \
--graph \
--abbrev-commit \
--decorate \
--format=format:'%C(bold blue)%h%C(reset) - %C(bold cyan)%aD%C(reset) %C(bold green)(%ar)%C(reset)%C(bold yellow)%d%C(reset)%n''          %C(white)%s%C(reset) %C(dim white)- %an%C(reset)' \
--all"

# Terraform
alias tf="terraform"

# Directories
alias repos="cd ~/Documents"


# Misc
alias ls='ls -GFhl'



# GCloud

