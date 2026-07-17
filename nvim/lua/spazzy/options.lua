-- Disable built-in netrw (replaced by nvim-tree)
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- UI
vim.opt.termguicolors = true
vim.opt.mouse = "a"
vim.opt.clipboard = "unnamedplus"
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.spell = true

-- Security — disable modelines to prevent arbitrary code execution via file headers
vim.opt.modelines = 0

-- Whitespace
vim.opt.wrap = true
vim.opt.textwidth = 79
vim.opt.formatoptions = "tcqrn1"
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.softtabstop = 2
vim.opt.expandtab = true

-- Cursor
vim.opt.scrolloff = 3
vim.opt.backspace = "indent,eol,start"

-- Folding (managed by nvim-ufo)
vim.opt.foldlevel = 99
vim.opt.foldmethod = "indent"
vim.opt.foldexpr = "v:lua.vim.treesitter.foldexpr()"
vim.opt.foldcolumn = "1"
vim.opt.foldtext = ""

-- Trailing whitespace highlight — real file buffers only. Skip special buffers
-- (dashboard, tree, help, ...). The check is deferred with vim.schedule because
-- snacks sets the dashboard's buftype/filetype with noautocmd *after* BufEnter,
-- so an immediate check would see an empty filetype and wrongly paint it.
vim.api.nvim_set_hl(0, 'TrailingWhitespace', { bg = 'LightRed' })
local tw_skip_ft = {
    snacks_dashboard = true, snacks_terminal = true, NvimTree = true,
    help = true, qf = true, lazy = true, mason = true, checkhealth = true,
}
vim.api.nvim_create_autocmd({ 'BufWinEnter', 'BufEnter' }, {
    pattern = '*',
    callback = function()
        vim.schedule(function()
            if vim.bo.buftype ~= '' or tw_skip_ft[vim.bo.filetype] then
                vim.opt_local.list = false
                vim.cmd('silent! syntax clear TrailingWhitespace')
            else
                vim.opt_local.list = true
                vim.cmd([[syntax clear TrailingWhitespace | syntax match TrailingWhitespace "\_s\+$"]])
            end
        end)
    end,
})

-- FreeMarker (.ftl) — parse as HTML via treesitter
vim.filetype.add({ extension = { ftl = 'ftl' } })
vim.treesitter.language.register('html', 'ftl')
