-- LSP: go install github.com/lighttiger2505/sqls@latest

local nvim_lsp = require('lspconfig')

nvim_lsp.sqls.setup{
  capabilities = capabilities,
  on_attach = lsp_on_attach,
  flags = {
    debounce_text_changes = 150,
  },
}
