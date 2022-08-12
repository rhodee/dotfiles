 -- LSP: npm i -g vscode-langservers-extracted
local nvim_lsp = require('lspconfig')
local cfg = require('config.lsp.attach')

nvim_lsp.jsonls.setup({
  capabilities = cfg.capabilities,
  on_attach = cfg.on_attach,
  flags = {
    debounce_text_changes = 150,
  },
})