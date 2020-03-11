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
alias repos="cd ~/Documents/repos"


# Misc
alias ls='ls -GFhl'


# VPNS
alias vpn-adidas="sudo openconnect --user=kampbre  --servercert pin-sha256:zp/T5zxZmfVpQK4cCPqTs1mHHLbvIv8ylj81K8NVhGw= https://devpngate02.adidas-group.com/"
alias vpn-gk="sudo openconnect --user=bkamp  https://webvpn.eurosoftware.cz"


# GCloud

