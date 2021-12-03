 -- LSP: npm i -g vscode-langservers-extracted
local nvim_lsp = require('lspconfig')

nvim_lsp.html.setup{
  capabilities = capabilities,
  on_attach = lsp_on_attach,
  flags = {
    debounce_text_changes = 150,
  }
}

