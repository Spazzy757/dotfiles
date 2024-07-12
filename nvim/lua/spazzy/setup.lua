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

require("guard").setup({
 fmt_on_save = true,
 lsp_as_default_formatter = false,
})

require('mason').setup()
require('mason-lspconfig').setup()

