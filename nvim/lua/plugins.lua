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
  {
    'nvim-telescope/telescope.nvim', 
    version="0.1.2",
    config = function()
      require('telescope').setup()
    end,
  },
}
