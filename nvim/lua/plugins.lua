-- Plugin Configurations
return {
  {
    'nvim-tree/nvim-tree.lua',
    config = function()
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
    end,
  },
  'williamboman/mason.nvim',
  'kdheepak/lazygit.nvim',
  'williamboman/mason-lspconfig.nvim',
  'junegunn/vim-easy-align',
  'nvim-tree/nvim-web-devicons',
  'hashivim/vim-terraform',
  'rust-lang/rust.vim',
  'mattn/webapi-vim',
  'ekalinin/Dockerfile.vim',
  'ray-x/go.nvim',
  'ray-x/guihua.lua',
  {
    'williamboman/nvim-lsp-installer',
    config = function()
      require("nvim-lsp-installer").setup()
    end,
  },
  'nvimdev/guard-collection',
  {
  "nvimdev/guard.nvim",
  config = function()
   local ft = require("guard.filetype")
   ft("c,cpp"):fmt("clang-format")
   require("guard").setup({
    fmt_on_save = true,
    lsp_as_default_formatter = false,
   })
  end,
 }, 
  'neovim/nvim-lspconfig',
  'hrsh7th/nvim-cmp',
  'hrsh7th/cmp-nvim-lsp',
  'hrsh7th/cmp-vsnip',
  'hrsh7th/vim-vsnip',
  'hrsh7th/cmp-buffer',
  'hrsh7th/cmp-path',
  'hrsh7th/cmp-cmdline',
  'nvim-treesitter/nvim-treesitter',
  'tpope/vim-fugitive',
  'shime/vim-livedown',
  'nvim-lua/plenary.nvim',
  'towolf/vim-helm',
  {
    'nvim-telescope/telescope.nvim', 
    version="0.1.2",
    config = function()
      require('telescope').setup()
    end,
  },
  "dhananjaylatkar/cscope_maps.nvim",
  "github/copilot.vim",
  "luisiacc/the-matrix.nvim",
  "theHamsta/nvim-dap-virtual-text",
  { "rcarriga/nvim-dap-ui", dependencies = {"mfussenegger/nvim-dap", "nvim-neotest/nvim-nio"} },
  dependencies = {
    "folke/which-key.nvim", -- optional [for whichkey hints]
    "nvim-telescope/telescope.nvim", -- optional [for picker="telescope"]
    "ibhagwan/fzf-lua", -- optional [for picker="fzf-lua"]
    "nvim-tree/nvim-web-devicons", -- optional [for devicons in telescope or fzf]
  },
  opts = {},
}
