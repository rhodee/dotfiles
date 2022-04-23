-- LSP: npm install -g @tailwindcss/language-server
local nvim_lsp = require('lspconfig')
local cfg = require('config.lsp')

nvim_lsp.tailwindcss.setup{
  on_attach = cfg.on_attach,
  flags = {
    debounce_text_changes = 150,
  },
}
