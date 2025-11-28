-- Install Parsers for all languages
require'nvim-treesitter.configs'.setup({
  sync_install = false,
  modules = {},
  ignore_install = {},
  auto_install = true,
  ensure_installed = "all",
  highlight = {
    enable = true
  },
})

-- Set code completion capabilities.
local capabilities = require('cmp_nvim_lsp').default_capabilities()

-- Add folding capabilities
capabilities.textDocument.foldingRange = {
    dynamicRegistration = false,
    lineFoldingOnly = true
}

-- NOTE: Use MASON to download language servers
--
-- Python
vim.lsp.config('pylsp', {
  capabilities = capabilities
})

vim.lsp.config('kotlin_language_server', {
  capabilities = capabilities
})
-- Golang
vim.lsp.config('gopls', {
  capabilities = capabilities
})

-- Rust
vim.lsp.config('rust_analyzer', {
  capabilities = capabilities
})
-- Lua
vim.lsp.config('lua_ls', {
  capabilities = capabilities,
  settings = {
    Lua = {
      runtime = {
        version = 'LuaJIT',
        path = vim.split(package.path, ';')
      },
      diagnostics = {
        globals = {'vim'}
      },
      workspace = {
        library = vim.api.nvim_get_runtime_file("", true)
      }
    }
  }
})
-- Yaml
vim.lsp.config('helm_ls', {
  capabilities = capabilities,
  settings = {
    ['helm-ls'] = {
      yamlls = {
        path = "yaml-language-server",
      }
    }
  }
})
vim.lsp.config('yamlls', {
  capabilities = capabilities
})
-- SQL
vim.lsp.config('sqlls', {
  capabilities = capabilities
})
-- JSON
vim.lsp.config('jsonls', {
  capabilities = capabilities
})
-- Terraform
-- Download Binary from https://github.com/hashicorp/terraform-ls/releases
vim.lsp.config('terraformls', {
  capabilities = capabilities
})
-- Docker Compose
-- npm i -g @microsoft/compose-language-service
vim.lsp.config('docker_compose_language_service', {
  capabilities = capabilities
})
-- Docker
vim.lsp.config('dockerls', {
  capabilities = capabilities
})
-- Bash
vim.lsp.config('bashls', {
  capabilities = capabilities
})
-- C Programming
vim.lsp.config('clangd', {
  capabilities = capabilities
})

require('ufo').setup()


