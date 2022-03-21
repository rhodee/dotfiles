-- LSP: npm install -g @tailwindcss/language-server
local nvim_lsp = require('lspconfig')

nvim_lsp.tailwindcss.setup{
  capabilities = capabilities,
  on_attach = on_attach,
  flags = {
    debounce_text_changes = 150,
  },
}
