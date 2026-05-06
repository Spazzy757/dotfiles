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
    cmd = { 'LivePreview', 'LivePreviewOpen', 'LivePreviewClose' },
    dependencies = { 'nvim-telescope/telescope.nvim' },
  },
  'folke/which-key.nvim',
  'ibhagwan/fzf-lua',
  'williamboman/mason.nvim',
  'williamboman/mason-lspconfig.nvim',
  -- language specific (lazy loaded by filetype)
  { 'hashivim/vim-terraform', ft = { 'terraform', 'hcl' } },
  { 'rust-lang/rust.vim', ft = { 'rust' } },
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
    ft = { 'go', 'gomod', 'gosum' },
    dependencies = { 'ray-x/guihua.lua' },
    config = function()
      require('go').setup({})
      local grp = vim.api.nvim_create_augroup("GoImport", {})
      vim.api.nvim_create_autocmd("BufWritePre", {
        pattern = "*.go",
        callback = function() require('go.format').goimport() end,
        group = grp,
      })
    end,
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
  "coder/claudecode.nvim",
    dependencies = { 
      "folke/snacks.nvim"
    },
    opts = {
	terminal_cmd = "~/.local/bin/claude", -- Point to local installation
    },
  },
  {
    "iamkarasik/sonarqube.nvim",
    opts = {},
  },
}
