require("nvim-tree").setup({
  sort_by = "case_sensitive",
  view = {
    width = 40,
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

require('telescope').setup({})

-- TODO See if this can be moved somewhere else
local ft = require("guard.filetype")

ft("c,cpp"):fmt("clang-format")
ft("terraform"):fmt({
  cmd = 'terraform',
  args = {'fmt', '-'},
})

vim.g.guard_config ={
 fmt_on_save = true,
 lsp_as_default_formatter = false,
  save_on_fmt = true,
}

require('mason').setup()
require('mason-lspconfig').setup()

