-- Setup language servers.
local lspconfig = require('lspconfig')

-- Python
lspconfig.pyright.setup {}

-- TypeScript
lspconfig.tsserver.setup {}

-- Golang
lspconfig.gopls.setup{}

-- Rust
lspconfig.rust_analyzer.setup {
  settings = {
    ['rust-analyzer'] = {},
  },
}

