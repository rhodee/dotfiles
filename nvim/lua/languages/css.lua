 -- LSP: npm i -g vscode-langservers-extracted
local nvim_lsp = require('lspconfig')

nvim_lsp.cssls.setup{
  capabilities = capabilities,
  on_attach = on_attach,
  flags = {
    debounce_text_changes = 150,
  }
}
