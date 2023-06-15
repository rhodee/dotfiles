local status, lspconfig = pcall(require, 'lspconfig')
if not status then return end

util = require('lspconfig/util')

lspconfig.gopls.setup({
    cmd = { 'gopls' },
	filetypes = {'go', 'gomod'},
    root_dir = util.root_pattern('go.work', 'go.mod', '.git'),
    settings = {
        gopls = {
            analyses = {
                nilness = true,
                shadow = true,
                useany = true,
                unusedparams = true,
				unusedvariable = true,
                unusedwrite = true,
            },
            experimentalPostfixCompletions = true,
            gofumpt = true,
            staticcheck = true,
            usePlaceholders = true,
        }
    },
	on_attach = on_attach,
})
