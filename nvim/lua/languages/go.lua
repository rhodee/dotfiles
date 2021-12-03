local on_attach = function(client, bufnr)
  -- Disabled default autoformatter until it is fixed
  client.resolved_capabilities.document_range_formatting = true
  client.resolved_capabilities.document_formatting = true
  lsp_on_attach(client, bufnr)
end

local nvim_go = require("go")

nvim_go.setup({
  goimport ='goimport', -- goimport command
  gofmt = 'gofmt', --gofmt cmd,
  max_line_len = 120, -- max line length in goline format
  tag_transform = false, -- tag_transfer check gomodifytags for details
  verbose = true,  -- output loginf in messages
  log_path = vim.fn.expand("$HOME") .. "/.config/nvim/gonvim.log",
  lsp_cfg = true, -- true: apply go.nvim non-default gopls setup
  lsp_gofumpt = false, -- true: set default gofmt in gopls format to gofumpt
  lsp_on_attach = on_attach, -- if a on_attach function provided:  attach on_attach function to gopls
                       -- true: will use go.nvim on_attach if true
                       -- nil/false do nothing

  lsp_codelens = false,
  -- gopls_remote_auto = true, -- set to false is you do not want to pass -remote=auto to gopls(enable share)
  -- gopls_cmd = nil,
  -- if you need to specify gopls path and cmd, e.g {"/home/user/lsp/gopls", "-logfile", "/var/log/gopls.log" }
  lsp_diag_hdlr = true, -- hook lsp diag handler
  dap_debug = true, -- set to true to enable dap
  dap_debug_keymap = true, -- set keymaps for debugger
  dap_debug_gui = true, -- set to true to enable dap gui, highly recommand
  dap_debug_vt = true, -- set to true to enable dap virtual text
})

