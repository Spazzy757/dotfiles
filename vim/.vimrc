" Don't try to be vi compatible
set nocompatible
set hidden

" Helps force plugins to load correctly when it is turned back on below
filetype off

" Load plugins here (pathogen or vundle)
source ~/.vim/plugs.vim

" Load Themes
source ~/.vim/theme.vim

" NerdTree Settings load
source ~/.vim/nerdtree.vim

" Languages
source ~/.vim/go.vim
source ~/.vim/python.vim
source ~/.vim/web.vim

" Miscellanious Configuration
source ~/.vim/misc.vim
