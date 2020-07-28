# Kubernetes
alias k="kubectl"

function kubens {
         kubectl config set-context $(kubectl config current-context) --namespace="$1";
}
export -f kubens


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
function repos {
      cd "$HOME/Documents/repos/$1/"
}
export -f repos
function csrepos {
      cd "$HOME/Documents/repos/container-solutions/$1/"
}
export -f csrepos

# Misc
alias ls='ls -GFhl'

# Load Aliases with secrets
if [-f "$HOME/.bash_protected"];
then
  source "$HOME/.bash_protected"
fi

