""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Nerdtree Configuration
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Show Hidden Files by Default
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let NERDTreeShowHidden=1

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Hide certain files
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let NERDTreeIgnore=['\.swp']

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Start NERDTree and leave the cursor in it.
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
autocmd VimEnter * NERDTree | wincmd p

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Exit Vim if NERDTree is the only window left.
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() |
    \ quit | endif

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Directroy icons
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:NERDTreeDirArrowExpandable = '▸'
let g:NERDTreeDirArrowCollapsible = '▾'


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Git Settings
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:NERDTreeGitStatusUseNerdFonts = 1 
let g:NERDTreeGitStatusShowIgnored = 1
let g:NERDTreeGitStatusShowClean = 1
