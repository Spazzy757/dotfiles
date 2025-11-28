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

require('telescope').setup({
 pickers = {
    find_files = {
      hidden = true
    },
    live_grep = {
      additional_args = function(opts)
        return {"--hidden"}
      end
    }
  }
})

require('mason').setup()
require('mason-lspconfig').setup()
require("sonarqube").setup({})
