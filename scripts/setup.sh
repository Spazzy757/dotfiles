# /usr/local/bin/bash
set -e
SystemType="$(uname -s)"
SkipSystemSetup=${SKIP_SYSTEM:=true}
echo "Setup for system type: $SystemType"

# Setup for Mac
if [[ "$SystemType" == "Darwin" && "$SkipSystemSetup" != "true" ]]; then
    curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh >> tmp.sh
    chmod +x tmp.sh
    ./tmp.sh
    rm -rf tmp.sh
    brew bundle -f brew/Brewfile
fi

echo "Setting Up Dotfiles"
# Links files directly to the home directory
home_configs=(bash git)

for config in "${home_configs[@]}"
do
    stow -v -R -t ~ $config/
done

directory_configs=(kube vim)
# Links files into subdirectories
for config in "${directory_configs[@]}"
do
    mkdir -p $HOME/.$config
    stow -v -R -t ~/.$config $config/
done

echo "Installing Bash It"
if [[ -d $HOME/.bash_it ]]; then
   rm -rf $HOME/.bash_it
fi
git clone --depth=1 https://github.com/Bash-it/bash-it.git ~/.bash_it
$HOME/.bash_it/install.sh --no-modify-config

