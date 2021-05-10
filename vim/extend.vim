"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Extend vim functionality
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Turn persistent undo on 
" means that you can undo even when you close a buffer/VIM
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set undodir=~/.vim/temp_dirs/undodir
set undofile

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Fast editing and reloading of vimrc configs
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
map <leader>e :e! ~/.vim/.vimrc<cr>
autocmd! bufwritepost ~/.vim/.vimrc source ~/.vim/.vimrc
