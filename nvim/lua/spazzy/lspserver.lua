-- Set up nvim-cmp.
local cmp = require('cmp')

cmp.setup({
  snippet = {
    expand = function(args)
      vim.fn["vsnip#anonymous"](args.body)
    end,
  },
  mapping = cmp.mapping.preset.insert({
    ['<C-b>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<C-e>'] = cmp.mapping.abort(),
    -- Accept currently selected item. Set `select` to `false` 
    -- to only confirm explicitly selected items.
    ['<CR>'] = cmp.mapping.confirm({ select = true }), 
  }),
  sources = cmp.config.sources({
    { name = 'nvim_lsp' },
    { name = 'vsnip' },
  }, {
    { name = 'buffer' },
  })
})

-- Use buffer source for `/` and `?`
cmp.setup.cmdline({ '/', '?' }, {
  mapping = cmp.mapping.preset.cmdline(),
  sources = {
    { name = 'buffer' }
  }
})

-- Use cmdline & path source for ':'
cmp.setup.cmdline(':', {
  mapping = cmp.mapping.preset.cmdline(),
  sources = cmp.config.sources({
    { name = 'path' }
  }, {
    { name = 'cmdline' }
  })
})

require('mason').setup()
require('mason-lspconfig').setup()

-- Set up lspconfig.
local capabilities = require('cmp_nvim_lsp').default_capabilities()

-- Python
-- pip install pyright
require('lspconfig')['pyright'].setup {
  capabilities = capabilities
}
-- TypeScript
-- npm i -g typescript typescript-language-server
require('lspconfig')['tsserver'].setup {
  capabilities = capabilities
}
-- Golang
-- go install golang.org/x/tools/gopls@latest
require('lspconfig')['gopls'].setup {
  capabilities = capabilities
}
-- Rust
-- Follow Instructions https://rust-analyzer.github.io/manual.html#rust-analyzer-language-server-binary
require('lspconfig')['rust_analyzer'].setup {
  capabilities = capabilities
}
-- Lua
-- Download Binary fro https://github.com/LuaLS/lua-language-server/releases
require('lspconfig')['lua_ls'].setup {
  capabilities = capabilities
}

-- Yaml
-- npm i -g yaml-language-server
require('lspconfig').helm_ls.setup {
  settings = {
    ['helm-ls'] = {
      yamlls = {
        path = "yaml-language-server",
      }
    }
  }
}

require('lspconfig').yamlls.setup {
  capabilities = capabilities
}
-- SQL
-- npm i -g sql-language-server
require('lspconfig')['sqlls'].setup {
  capabilities = capabilities
}
-- JSON
-- npm i -g vscode-langservers-extracted
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
-- npm i -g dockerfile-language-server-nodejs
require('lspconfig')['dockerls'].setup {
  capabilities = capabilities
}
-- Bash
-- npm i -g bash-language-server
require('lspconfig')['bashls'].setup {
  capabilities = capabilities
}
-- C Programming
require('lspconfig')['clangd'].setup {
  capabilities = capabilities
}
