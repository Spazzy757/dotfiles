
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"leader key
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nnoremap <SPACE> <Nop>
let mapleader="\<Space>" 

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Move up/down editor lines
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nnoremap j gj
nnoremap k gk

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"split navigations
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Searching
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nnoremap / /\v
vnoremap / /\v
map <leader><space> :let @/=''<cr> " clear search

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Remap help key.
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
inoremap <F1> <ESC>:set invfullscreen<CR>a
nnoremap <F1> :set invfullscreen<CR>
vnoremap <F1> :set invfullscreen<CR>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Formatting
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
map <leader>q gqip

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Visualize tabs and newlines
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" leader key + l to toggle on/off
map <leader>l :set list!<CR> " Toggle tabs and EOL

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Auto Complete YouCompleteMe keybindings
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
map <leader>g  :YcmCompleter GoToDefinitionElseDeclaration<CR>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" NERDTree
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nnoremap <leader>n :NERDTreeFocus<CR>
nnoremap <C-n> :NERDTree<CR>
nnoremap <C-t> :NERDTreeToggle<CR>
nnoremap <C-f> :NERDTreeFind<CR>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" comment and uncomment languages
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
map <leader>a :call Comment()<CR>
map <leader>b :call Uncomment()<CR>
