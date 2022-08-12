-- LSP: npm install -g typescript-language-server typescript
local nvim_lsp = require('lspconfig')
local cfg = require('config.lsp.attach')

nvim_lsp.tsserver.setup({
  capabilities = cfg.capabilities,
  on_attach = cfg.on_attach,
  flags = {
    debounce_text_changes = 150,
  },
  filetypes = { 'typescript', 'typescriptreact', 'typescript.tsx' },
  cmd = { 'typescript-language-server', '--stdio' },
})
