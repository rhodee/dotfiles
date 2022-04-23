 -- LSP: npm i -g vscode-langservers-extracted
local nvim_lsp = require('lspconfig')
local cfg = require('config.lsp')

nvim_lsp.cssls.setup{
  on_attach = cfg.on_attach,
  flags = {
    debounce_text_changes = 150,
  }
}

