""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Golang Configuration
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" format with goimports instead of gofmt
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:go_fmt_command = "goimports"
let g:go_fmt_autosave = 1

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Syntax Highlighting
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:go_highlight_fields = 1
let g:go_highlight_functions = 1
let g:go_highlight_function_calls = 1
let g:go_highlight_extra_types = 1
let g:go_highlight_operators = 1

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Status line types/signatures
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:go_auto_type_info = 1

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Run :GoBuild or :GoTestCompile based on the go file
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! s:build_go_files()
  let l:file = expand('%')
  if l:file =~# '^\f\+_test\.go$'
    call go#test#Test(0, 1)
  elseif l:file =~# '^\f\+\.go$'
    call go#cmd#Build(0)
  endif
endfunction

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Map keys for most used commands.
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
autocmd FileType go nmap <leader>b :<C-u>call <SID>build_go_files()<CR>
autocmd FileType go nmap <leader>r  <Plug>(go-run)
autocmd FileType go nmap <leader>t  <Plug>(go-test)
