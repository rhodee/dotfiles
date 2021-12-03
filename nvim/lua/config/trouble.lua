local trouble = require("trouble")

trouble.setup({
  auto_open = false, -- automatically open the list when you have diagnostics
  auto_close = true, -- automatically close the list when you have no diagnostics
  use_lsp_diagnostic_signs = true, -- enabling this will use the signs defined in your lsp client
  auto_preview = true,
  auto_fold = true,
  height = 7,
  icons = false,
  mode = "lsp_workspace_diagnostics",
  fold_open = "v",
  fold_closed = ">",
})
