local status, lspconfig = pcall(require, "lspconfig")
if not status then
    return
end

lspconfig.gopls.setup({
    cmd = { 'gopls' },
    settings = {
        gopls = {
            analyses = {
                nilness = true,
                unusedparams = true,
                unusedwrite = true,
                useany = true,
            },
            experimentalPostfixCompletions = true,
            gofumpt = true,
            staticcheck = true,
            usePlaceholders = true,
        }
    },
	on_attach = on_attach,
})
