-- LSP: go install github.com/lighttiger2505/sqls@latest
local nvim_lsp = require('lspconfig')
local cfg = require('config.lsp')

nvim_lsp.sqls.setup{
  on_attach = cfg.on_attach,
  flags = {
    debounce_text_changes = 150,
  },
}
