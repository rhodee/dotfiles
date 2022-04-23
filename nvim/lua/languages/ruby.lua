-- LSP: gem install solargraph
local nvim_lsp = require('lspconfig')
local cfg = require('config.lsp')

nvim_lsp.solargraph.setup({
  on_attach = cfg.on_attach,
  flags = {
    debounce_text_changes = 150,
  },
})