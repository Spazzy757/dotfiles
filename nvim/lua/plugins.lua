-- Plugins
return {
  'neovim/nvim-lspconfig',
  'nvim-tree/nvim-tree.lua',
  'nvim-tree/nvim-web-devicons',
  'nvim-treesitter/nvim-treesitter',
  'nvim-lua/plenary.nvim',
  {
  "nvim-telescope/telescope.nvim",
  -- etc.
    keys = {
      { "zf", "<Cmd>Telescope spell_suggest<CR>", desc = "Telescope: Find spell word suggestion" },
    -- etc.
      },
  },
  {
    'brianhuster/live-preview.nvim',
    dependencies = {
        -- You can choose one of the following pickers
        'nvim-telescope/telescope.nvim',
    },
  },
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
  {
    "iamcco/markdown-preview.nvim",
    cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
    build = "cd app && yarn install",
    init = function()
      vim.g.mkdp_filetypes = { "markdown" }
    end,
    ft = { "markdown" },
  },
  {
    "CopilotC-Nvim/CopilotChat.nvim",
    dependencies = {
      { "github/copilot.vim" }, -- or zbirenbaum/copilot.lua
      { "nvim-lua/plenary.nvim", branch = "master" }, -- for curl, log and async functions
    }
  },
  {
    "iamkarasik/sonarqube.nvim",
  },
}
