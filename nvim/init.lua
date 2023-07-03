vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

require('lspserver')
require('comments')
require('markdown')
require('plugins')
require('golang')



vim.opt.termguicolors = true
require("nvim-tree").setup({
  sort_by = "case_sensitive",
  view = {
    width = 30,
  },
  renderer = {
    group_empty = true,
  },
  git = {
    enable = true,
    ignore = false,
    timeout = 500,
  },
})


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
vim.opt.foldmethod="indent"
vim.opt.foldlevel=99

vim.keymap.set('n', '<space>n', ':NvimTreeFocus<CR>', { silent = true })
vim.keymap.set('n', '<space>c', ':source $MYVIMRC<CR>', { silent = true })
