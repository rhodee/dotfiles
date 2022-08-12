-- LSP: go install github.com/lighttiger2505/sqls@latest
local nvim_lsp = require('lspconfig')
local cfg = require('config.lsp.attach')

nvim_lsp.sqls.setup{
  capabilities = cfg.capabilities,
  on_attach = cfg.on_attach,
  flags = {
    debounce_text_changes = 150,
  },
}
