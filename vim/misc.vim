""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" File for all extra configuration
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Turn on syntax highlighting
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
syntax on

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" For plugins to load correctly
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
filetype plugin indent on

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Auto Complete YouCompleteMe Settings
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:ycm_autoclose_preview_window_after_completion=1

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Security
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set modelines=0

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Turn on spell
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set spell

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Show line numbers
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set number
set relativenumber

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Setyp Shared Clipboards
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set clipboard^=unnamedplus
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Show file stats
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set ruler

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Blink cursor on error instead of beeping (grr)
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set visualbell

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" custom fuzzy search command for control p using find
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:ctrlp_user_command = 'find %s -type f'  

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Encoding
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set encoding=utf-8

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Whitespace
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set wrap
set textwidth=79
set formatoptions=tcqrn1
set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab
set noshiftround

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Cursor motion
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set scrolloff=3
set backspace=indent,eol,start
set matchpairs+=<:> " use % to jump between pairs
runtime! macros/matchit.vim

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Split buffers below
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set splitbelow
set splitright

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Allow hidden buffers
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set hidden

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Rendering
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set ttyfast

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Enable folding
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set foldmethod=indent
set foldlevel=99

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Saves what a buffer looks like on exit
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
autocmd BufWinLeave *.* mkview
autocmd BufWinEnter *.* silent loadview

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"Mode Settings
"Cursor settings:

"  1 -> blinking block
"  2 -> solid block 
"  3 -> blinking underscore
"  4 -> solid underscore
"  5 -> blinking vertical bar
"  6 -> solid vertical bar
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let &t_SI.="\e[5 q" "SI = INSERT mode
let &t_SR.="\e[4 q" "SR = REPLACE mode
let &t_EI.="\e[1 q" "EI = NORMAL mode (ELSE)

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Status bar
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set laststatus=2

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Last line
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set showmode
set showcmd

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Searching
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set hlsearch
set incsearch
set ignorecase
set smartcase
set showmatch

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Visualize tabs and newlines
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set listchars=tab:▸\ ,eol:¬
" To enable by default
set list

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Wiki Settings
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:vimwiki_list = [{'path': '~/repos/spazzy/dotfiles/wikis'}]
let g:vimwiki_global_ext = 0

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Functions for commenting and uncommenting code
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! Comment()
	let ft = &filetype
	if ft == 'perl' || ft == 'ruby' || ft == 'sh' || ft == 'make' || ft == 'python' || ft == 'yaml' || ft == 'terraform'
		silent s/^/\#/
	elseif ft == 'javascript' || ft == 'c' || ft == 'cpp' || ft == 'java' || ft == 'objc' || ft == 'scala' || ft == 'go' || ft == 'rust'
		silent s:^:\/\/:g
	elseif ft == 'tex'
		silent s:^:%:g
	elseif ft == 'vim'
		silent s:^:\":g
	endif
endfunction

function! Uncomment()
	let ft = &filetype
	if ft == 'perl' || ft == 'ruby' || ft == 'sh' || ft == 'make' || ft == 'python' || ft == 'yaml' || ft == 'terraform'
		silent s/^\#//
	elseif ft == 'javascript' || ft == 'c' || ft == 'cpp' || ft == 'java' || ft == 'objc' || ft == 'scala' || ft == 'go' || ft == 'rust'
		silent s:^\/\/::g
	elseif ft == 'tex'
		silent s:^%::g
	elseif ft == 'vim'
		silent s:^\"::g
	endif
endfunction
