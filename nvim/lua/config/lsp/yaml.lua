-- LSP: npm i -g yaml-language-server
local nvim_lsp = require('lspconfig')
local cfg = require('config.lsp.attach')

nvim_lsp.yamlls.setup{
  capabilities = cfg.capabilities,
  on_attach = cfg.on_attach,
  flags = {
    debounce_text_changes = 150,
  },
}
