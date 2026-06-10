-- Folding
vim.keymap.set('n', 'zR', require('ufo').openAllFolds)
vim.keymap.set('n', 'zM', require('ufo').closeAllFolds)

-- File tree
vim.keymap.set('n', '<leader>n', ':NvimTreeFocus<CR>', { silent = true })

-- Reload config
vim.keymap.set('n', '<leader>c', ':source $HOME/.config/nvim/init.lua<CR>', { silent = true })

-- Inline diagnostics
vim.keymap.set('n', '<leader>e', ':lua vim.diagnostic.open_float(0, {scope="line"})<CR>', { silent = true })

-- Go to definition (falls back to ctags)
vim.keymap.set('n', 'gd', '<c-]>', { remap = true })
