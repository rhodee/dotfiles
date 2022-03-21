-- LSP: npm i -g yaml-language-server

local nvim_lsp = require('lspconfig')

nvim_lsp.yamlls.setup{
  capabilities = capabilities,
  on_attach = on_attach,
  flags = {
    debounce_text_changes = 150,
  },
}
