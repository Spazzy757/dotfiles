require("nvim-tree").setup({
  sort_by = "case_sensitive",
  view = {
    width = 40,
    side = "right",
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

require('mason').setup()
require('mason-lspconfig').setup()

