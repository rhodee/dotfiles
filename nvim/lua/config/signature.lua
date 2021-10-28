require("lspconfig").gopls.setup({
  on_attach = function(client, bufno)
    require("lsp_signature").on_attach()
  end,
})

require("lsp_signature").setup({
  bind = true,
  floating_window = true,
  floating_window_above_cur_line = true,
  handler_opts = {
    border = "double"
  }
})
