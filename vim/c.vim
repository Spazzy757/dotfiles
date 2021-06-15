""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" C settings
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Format on Save
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! FormatSave()
    let cursor_pos = getpos('.')
    :%!clang-format
    call setpos('.', cursor_pos)
endfunction 
autocmd BufWritePre *.h,*.hpp,*.c,*.cpp,*.vert,*.frag :call FormatSave()
