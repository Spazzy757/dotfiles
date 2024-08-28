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

-- Set code completion capabailities.
local capabilities = require('cmp_nvim_lsp').default_capabilities()

-- Add folding capabilities
capabilities.textDocument.foldingRange = {
    dynamicRegistration = false,
    lineFoldingOnly = true
}

-- NOTE: Use MASON to download language servers
--
-- Python
require('lspconfig')['pylsp'].setup {
  capabilities = capabilities
}
-- TypeScript
require('lspconfig')['tsserver'].setup {
  capabilities = capabilities
}
-- Golang
require('lspconfig')['gopls'].setup {
  capabilities = capabilities
}
-- Rust
require('lspconfig')['rust_analyzer'].setup {
  capabilities = capabilities
}
-- Lua
require('lspconfig')['lua_ls'].setup {
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
}
-- Yaml
require('lspconfig')['helm_ls'].setup {
  capabilities = capabilities,
  settings = {
    ['helm-ls'] = {
      yamlls = {
        path = "yaml-language-server",
      }
    }
  }
}
require('lspconfig')['yamlls'].setup {
  capabilities = capabilities
}
-- SQL
require('lspconfig')['sqlls'].setup {
  capabilities = capabilities
}
-- JSON
require('lspconfig')['jsonls'].setup {
  capabilities = capabilities
}
-- Terraform
-- Download Binary from https://github.com/hashicorp/terraform-ls/releases
require('lspconfig')['terraformls'].setup {
  capabilities = capabilities
}
-- Docker Compose
-- npm i -g @microsoft/compose-language-service
require('lspconfig')['docker_compose_language_service'].setup {
  capabilities = capabilities
}
-- Docker
require('lspconfig')['dockerls'].setup {
  capabilities = capabilities
}
-- Bash
require('lspconfig')['bashls'].setup {
  capabilities = capabilities
}
-- C Programming
require('lspconfig')['clangd'].setup {
  capabilities = capabilities
}

require('ufo').setup()


