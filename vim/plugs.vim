""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Plugin Configurations
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Install vim-plug if not found
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
endif

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Plugins to install on load
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
call plug#begin('~/.vim/plugged')

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" https://github.com/junegunn/vim-easy-align
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
Plug 'junegunn/vim-easy-align'

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" https://github.com/preservim/nerdtree
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
Plug 'preservim/nerdtree'

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" https://github.com/Xuyuanp/nerdtree-git-Plugins
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
Plug 'Xuyuanp/nerdtree-git-plugin'

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" https://github.com/tpope/vim-fireplace
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
Plug 'tpope/vim-fireplace'

" Golang
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" https://github.com/fatih/vim-go
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
Plug 'fatih/vim-go', { 'tag': '*',  'do': ':GoUpdateBinaries' }

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" https://github.com/kien/ctrlp.vim
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
Plug 'kien/ctrlp.vim'

" Python
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" https://github.com/tmhedberg/SimpylFold
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
Plug 'tmhedberg/SimpylFold'

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" https://github.com/vim-scripts/indentpython.vim
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
Plug 'vim-scripts/indentpython.vim'

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" https://github.com/nvie/vim-flake8
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
Plug 'nvie/vim-flake8'

" Markdown
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" https://github.com/godlygeek/tabular
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
Plug 'godlygeek/tabular'

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" https://github.com/plasticboy/vim-markdown
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
Plug 'plasticboy/vim-markdown'

" Autocomplete
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" https://github.com/ycm-core/YouCompleteMe
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
Plug 'Valloric/YouCompleteMe'

" Syntax Highlighting
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" https://github.com/vim-syntastic/syntastic
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
Plug 'vim-syntastic/syntastic'

" Themes
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" https://github.com/altercation/vim-colors-solarized
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
Plug 'altercation/vim-colors-solarized'
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" https://github.com/ryanoasis/vim-devicons
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
Plug 'ryanoasis/vim-devicons'

" Wiki
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" https://github.com/vimwiki/vimwiki
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
Plug 'vimwiki/vimwiki'

" Terraform
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" https://github.com/hashivim/vim-terraform
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
Plug 'hashivim/vim-terraform'

" Rust
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" https://github.com/rust-lang/rust.vim
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
Plug 'rust-lang/rust.vim'

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" https://github.com/mattn/webapi-vim
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
Plug 'mattn/webapi-vim'

" Dockerfiles
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" https://github.com/mattn/webapi-vim
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
Plug 'ekalinin/Dockerfile.vim'

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Initialize plugin system
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
call plug#end()

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Run PlugInstall if there are missing plugins
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
autocmd VimEnter * if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
  \| PlugInstall --sync | source $MYVIMRC
\| endif
