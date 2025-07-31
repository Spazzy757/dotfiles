# If not running interactively, don't do anything
if [[ -f $HOME/.bash_profile ]];
then
    source $HOME/.bash_profile
fi



# Scaleway CLI autocomplete initialization.
eval "$(scw autocomplete script shell=bash)"
