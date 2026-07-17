-- Mason installs LSP servers under this dir. mason.nvim is lazy-loaded (on :Mason),
-- so add its bin to PATH here to keep server binaries resolvable at startup.
vim.env.PATH = vim.fn.stdpath('data') .. '/mason/bin:' .. vim.env.PATH

-- =============================================================================
-- Treesitter
-- =============================================================================

require('nvim-treesitter.configs').setup({
  sync_install = false,
  modules = {},
  ignore_install = {},
  auto_install = true,
  ensure_installed = {
    "bash", "c", "dockerfile", "go", "gomod", "helm",
    "json", "kotlin", "lua", "markdown", "python",
    "rust", "sql", "terraform", "toml", "typescript",
    "yaml",
  },
  highlight = {
    enable = true,
  },
})

-- =============================================================================
-- LSP capabilities
-- =============================================================================

local capabilities = require('cmp_nvim_lsp').default_capabilities()

-- Required by nvim-ufo for fold range support
capabilities.textDocument.foldingRange = {
  dynamicRegistration = false,
  lineFoldingOnly = true,
}

-- NOTE: install language servers via :Mason

-- =============================================================================
-- Language servers
-- =============================================================================

vim.lsp.config('pylsp',                           { capabilities = capabilities })
vim.lsp.config('kotlin_language_server',          { capabilities = capabilities })
vim.lsp.config('gopls',                           { capabilities = capabilities })
vim.lsp.config('rust_analyzer',                   { capabilities = capabilities })
vim.lsp.config('yamlls',                          { capabilities = capabilities })
vim.lsp.config('sqlls',                           { capabilities = capabilities })
vim.lsp.config('jsonls',                          { capabilities = capabilities })
vim.lsp.config('terraformls',                     { capabilities = capabilities })
vim.lsp.config('docker_compose_language_service', { capabilities = capabilities })
vim.lsp.config('dockerls',                        { capabilities = capabilities })
vim.lsp.config('bashls',                          { capabilities = capabilities })
vim.lsp.config('clangd',                          { capabilities = capabilities })

vim.lsp.config('lua_ls', {
  capabilities = capabilities,
  settings = {
    Lua = {
      runtime = {
        version = 'LuaJIT',
        path = vim.split(package.path, ';'),
      },
      diagnostics = {
        globals = { 'vim' },
      },
      workspace = {
        library = vim.api.nvim_get_runtime_file("", true),
      },
    },
  },
})

-- Helm — delegates YAML to yaml-language-server
vim.lsp.config('helm_ls', {
  capabilities = capabilities,
  settings = {
    ['helm-ls'] = {
      yamlls = {
        path = "yaml-language-server",
      },
    },
  },
})

-- Enable the configured servers (previously done by mason-lspconfig's automatic_enable).
-- Each starts on its filetype via nvim-lspconfig's shipped config.
vim.lsp.enable({
  'pylsp', 'kotlin_language_server', 'gopls', 'rust_analyzer', 'yamlls', 'sqlls',
  'jsonls', 'terraformls', 'docker_compose_language_service', 'dockerls', 'bashls',
  'clangd', 'lua_ls', 'helm_ls',
})

-- =============================================================================
-- Folding (nvim-ufo)
-- =============================================================================

require('ufo').setup()
