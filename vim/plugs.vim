" Install vim-plug if not found
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
endif

" Plugins to install on load
call plug#begin('~/.vim/plugged')

" Make sure you use single quotes

" Shorthand notation; fetches https://github.com/junegunn/vim-easy-align
Plug 'junegunn/vim-easy-align'

" On-demand loading
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'tpope/vim-fireplace', { 'for': 'clojure' }

" Using a tagged release; wildcard allowed (requires git 1.9.2 or above)
Plug 'fatih/vim-go', { 'tag': '*',  'do': ':GoUpdateBinaries' }

" Control Space for finding files
Plug 'vim-ctrlspace/vim-ctrlspace'

Plug 'kien/ctrlp.vim'

" For Code folding
Plug 'tmhedberg/SimpylFold'

" Python
Plug 'vim-scripts/indentpython.vim'
Plug 'nvie/vim-flake8'

" Autocomplete
Plug 'Valloric/YouCompleteMe'

" Syntax Highlighting
Plug 'vim-syntastic/syntastic'

" Themes
Plug 'altercation/vim-colors-solarized'

" Initialize plugin system
call plug#end()

" Run PlugInstall if there are missing plugins
autocmd VimEnter * if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
  \| PlugInstall --sync | source $MYVIMRC
\| endif
