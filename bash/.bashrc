# If not running interactively, don't do anything
case $- in
    *i*) ;;
    *) return;;
esac

if [ -f './.bash_profile' ]; then
    source "./.bash_profile"
fi

