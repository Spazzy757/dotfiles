local builtin = require('telescope.builtin')
--Key Bindings For Search
-- Find File
vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
-- Git Files
vim.keymap.set('n', '<leader>fg', builtin.git_files)
-- Live Grep
vim.keymap.set('n', '<leader>fl', builtin.live_grep)
-- Buffers
vim.keymap.set('n', '<leader>fb', builtin.buffers)
-- Help Tags
vim.keymap.set('n', '<leader>fh', builtin.help_tags)
-- Previously Opened Files
vim.keymap.set('n', '<leader>fo', builtin.oldfiles)
