-- LSP: npm install -g typescript-language-server typescript
local nvim_lsp = require('lspconfig')
local cfg = require('config.lsp')

nvim_lsp.tsserver.setup({
	server = {
		on_attach = cfg.on_attach,
		flags = {
			debounce_text_changes = 150,
		},
	}
})

