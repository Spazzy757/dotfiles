-- Plugins
return {
  'neovim/nvim-lspconfig',
  'nvim-tree/nvim-tree.lua',
  'nvim-tree/nvim-web-devicons',
  'nvim-treesitter/nvim-treesitter',
  'nvim-lua/plenary.nvim',
  'nvim-telescope/telescope.nvim',
  'folke/which-key.nvim',
  'ibhagwan/fzf-lua',
  'williamboman/mason.nvim',
  'williamboman/mason-lspconfig.nvim',
  -- language specific
  'hashivim/vim-terraform',
  'rust-lang/rust.vim',
  -- theme
  'EdenEast/nightfox.nvim',
  {
  -- completions
    'hrsh7th/nvim-cmp',
    dependencies = {
      'hrsh7th/cmp-nvim-lsp',
      'hrsh7th/cmp-vsnip',
      'hrsh7th/vim-vsnip',
      'hrsh7th/cmp-buffer',
      'hrsh7th/cmp-path',
      'hrsh7th/cmp-cmdline',
      'towolf/vim-helm',
      'github/copilot.vim',
    }
  },
  {
    'nvimdev/guard-collection',
    dependencies = {
      'nvimdev/guard.nvim',
    },
  },
  {
    'kevinhwang91/nvim-ufo',
    dependencies = {
      'kevinhwang91/promise-async',
    }
  },
  {
    'mfussenegger/nvim-dap',
    dependencies = {
      'rcarriga/nvim-dap-ui',
      'nvim-neotest/nvim-nio',
      'theHamsta/nvim-dap-virtual-text',
    }
  },
  {
    'ray-x/go.nvim',
    dependencies = {
      'ray-x/guihua.lua',
    },
  },
}
