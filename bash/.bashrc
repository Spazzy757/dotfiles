# If not running interactively, don't do anything
if [[ -f $HOME/.bash_profile ]];
then
    source $HOME/.bash_profile
fi


[ -f ~/.fzf.bash ] && source ~/.fzf.bash
