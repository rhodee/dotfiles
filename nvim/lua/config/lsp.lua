lsp_on_attach = function(client, bufnr)
  local g = vim.g
  local nvim_lsp = require("lspconfig")
  local map = vim.api.nvim_set_keymap

  -- Enable completion triggered by <c-x><c-o>
 vim.api.nvim_set_option("omnifunc", "v:lua.vim.lsp.omnifunc")
 vim.api.nvim_buf_set_option(0, "omnifunc", "v:lua.vim.lsp.omnifunc")

  -- Mappings.
  local opts = { noremap=true, silent=true }
  -- See `:help vim.lsp.*` for documentation on any of the below functions

  -- Moving around
  map('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>', opts)
  map('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
  map('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)

  -- Information
  map('n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
  map('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)

  -- Actions
  map('n', '<leader>ga', '<cmd>lua require"telescope.builtin".lsp_code_actions()<CR>', opts)
  map('v', '<leader>ga', '<cmd>lua require"telescope.builtin".range_code_actions()<CR>', opts)
  map('n', '<leader>gf', '<cmd>lua vim.lsp.buf.formatting()<CR>', opts)
  map('n', '<leader>r', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
end
