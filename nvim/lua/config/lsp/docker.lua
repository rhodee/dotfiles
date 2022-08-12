-- LSP: npm i -g dockerfile-language-server-nodejs
local nvim_lsp = require('lspconfig')
local cfg = require('config.lsp.attach')

nvim_lsp.dockerls.setup({
  capabilities = cfg.capabilities,
  on_attach = cfg.on_attach,
  flags = {
    debounce_text_changes = 150,
  }
})