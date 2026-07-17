-- Plugins
return {
  'neovim/nvim-lspconfig',
  {
    'nvim-tree/nvim-tree.lua',
    keys = { { '<leader>n', '<cmd>NvimTreeFocus<cr>', silent = true, desc = 'File tree' } },
    cmd = { 'NvimTreeFocus', 'NvimTreeToggle', 'NvimTreeOpen', 'NvimTreeFindFile', 'NvimTreeClose' },
    opts = {
      sort_by = 'case_sensitive',
      view = { width = 40, side = 'right' },
      renderer = { group_empty = true },
      git = { enable = true, ignore = false, timeout = 500 },
    },
  },
  'nvim-tree/nvim-web-devicons',
  'nvim-treesitter/nvim-treesitter',
  'nvim-lua/plenary.nvim',
  {
    "nvim-telescope/telescope.nvim",
    cmd = "Telescope",
    keys = {
      { "zf", "<Cmd>Telescope spell_suggest<CR>", desc = "Telescope: Find spell word suggestion" },
      { "<leader>ff", "<Cmd>Telescope find_files<CR>", desc = "Telescope: Find files" },
      { "<leader>fg", "<Cmd>Telescope git_files<CR>", desc = "Telescope: Git files" },
      { "<leader>fl", "<Cmd>Telescope live_grep<CR>", desc = "Telescope: Live grep" },
      { "<leader>fb", "<Cmd>Telescope buffers<CR>", desc = "Telescope: Buffers" },
      { "<leader>fh", "<Cmd>Telescope help_tags<CR>", desc = "Telescope: Help tags" },
      { "<leader>fo", "<Cmd>Telescope oldfiles<CR>", desc = "Telescope: Old files" },
    },
    opts = {
      pickers = {
        find_files = { hidden = true },
        live_grep = { additional_args = function() return { "--hidden" } end },
      },
    },
  },
  {
    'brianhuster/live-preview.nvim',
    cmd = { 'LivePreview', 'LivePreviewOpen', 'LivePreviewClose' },
    dependencies = { 'nvim-telescope/telescope.nvim' },
  },
  'folke/which-key.nvim',
  'ibhagwan/fzf-lua',
  {
    'williamboman/mason.nvim',
    cmd = { 'Mason', 'MasonInstall', 'MasonUninstall', 'MasonUninstallAll', 'MasonLog', 'MasonUpdate' },
    dependencies = {
      -- LSP servers are enabled explicitly via vim.lsp.enable() in spazzy/lspserver.lua,
      -- so automatic_enable is off (it would otherwise require loading at startup).
      { 'williamboman/mason-lspconfig.nvim', opts = { automatic_enable = false } },
    },
    opts = {},
  },
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
    cmd = { 'DapContinue', 'DapToggleBreakpoint', 'DapStepOver', 'DapStepInto', 'DapStepOut', 'DapTerminate' },
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
    -- In-editor markdown rendering (headings, lists, code, tables, checkboxes)
    "MeanderingProgrammer/render-markdown.nvim",
    ft = { "markdown" },
    dependencies = {
      "nvim-treesitter/nvim-treesitter",
      "nvim-tree/nvim-web-devicons",
    },
    opts = {
      -- contained code blocks (not a full-width grey slab) with a subtle border
      code = {
        width = "block",
        min_width = 45,
        left_pad = 2,
        right_pad = 2,
        border = "thin",
      },
      -- terminals can't truly resize text, so imply a size hierarchy: top
      -- headings are full-width banners, deeper ones hug their text, with a
      -- divider line under each.
      heading = {
        width = { "full", "full", "block", "block", "block", "block" },
        border = true,
        right_pad = 2,
      },
      -- no sign-column clutter
      sign = { enabled = false },
    },
  },
  {
    -- Startup dashboard (snacks is also pulled in by claudecode.nvim below;
    -- lazy.nvim merges both specs for this plugin).
    "folke/snacks.nvim",
    lazy = false,
    priority = 1000,
    opts = {
      dashboard = {
        enabled = true,
        preset = {
          header = [[
   ███████ ██████   █████  ███████ ███████ ██    ██
   ██      ██   ██ ██   ██    ███     ███   ██  ██
   ███████ ██████  ███████   ███     ███     ████
        ██ ██      ██   ██  ███     ███       ██
   ███████ ██      ██   ██ ███████ ███████    ██]],
          keys = {
            { icon = " ", key = "f", desc = "Find File", action = ":Telescope find_files" },
            { icon = " ", key = "g", desc = "Live Grep", action = ":Telescope live_grep" },
            { icon = " ", key = "r", desc = "Recent Files", action = ":Telescope oldfiles" },
            { icon = " ", key = "c", desc = "Config", action = ":e $HOME/.config/nvim/init.lua" },
            { icon = "󰒲 ", key = "l", desc = "Lazy", action = ":Lazy" },
            { icon = " ", key = "q", desc = "Quit", action = ":qa" },
          },
        },
        sections = {
          { section = "header" },
          { section = "keys", gap = 1, padding = 1 },
          { section = "startup" },
        },
      },
    },
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
