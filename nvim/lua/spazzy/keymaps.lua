--Misc
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
vim.opt.termguicolors = true
vim.opt.mouse="a"
vim.opt.filetype="on"
vim.opt.clipboard="unnamedplus"

-- Security
vim.opt.modelines=0

-- Line Numbers
vim.opt.number=true
vim.opt.relativenumber=true

-- Whitespace
vim.opt.wrap=true
vim.opt.textwidth=79
vim.opt.formatoptions="tcqrn1"
vim.opt.tabstop=2
vim.opt.shiftwidth=2
vim.opt.softtabstop=2
vim.opt.expandtab=true

-- Cursor Motion
vim.opt.scrolloff=3
vim.opt.backspace="indent,eol,start"

-- Enable Folding
vim.opt.foldlevel=99
vim.opt.foldmethod = "indent"
vim.opt.foldexpr = "v:lua.vim.treesitter.foldexpr()"
vim.opt.foldcolumn = "1"
vim.opt.foldtext = ""
vim.keymap.set('n', 'zR', require('ufo').openAllFolds)
vim.keymap.set('n', 'zM', require('ufo').closeAllFolds)

vim.keymap.set('n', '<leader>n', ':NvimTreeFocus<CR>', { silent = true })
vim.keymap.set('n', '<leader>c', ':source $HOME/.config/nvim/init.lua<CR>', { silent = true })
vim.keymap.set('n', '<leader>e', ':lua vim.diagnostic.open_float(0, {scope="line"})<CR>', { silent=true })
vim.keymap.set('n', 'gd', '<c-]>', { remap = true })

