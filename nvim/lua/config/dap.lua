local dap = require('dap')

local g = vim.g
local fn = vim.fn

require('dapui').setup({})
require('nvim-dap-virtual-text').setup({})
require('dap-go').setup({})

fn.sign_define('DapBreakpoint', {
  text = 'ß',
  texthl = 'healthError',
  linehl = 'CursorLine',
  numhl = '',
})

g.dap_virtual_text = true

dap.adapters.lldb = {
  type = 'executable',
  command = '/usr/bin/lldb-vscode-11',
  name = 'lldb',
}

dap.configurations.cpp = {
  {
    name = 'Launch',
    type = 'lldb',
    request = 'launch',
    program = function()
      fn.input('Path to executable', fn.getcwd() .. '/', 'file')
    end,
    cwd = "${workspaceFolder}",
    stopOnEntry = false,
    args = {},
    -- if 'runInTerminal' = true, yama/ptrace_scope setting may need to be changed:
    -- echo 0 | sudo tee /proc/sys/kernel/yama/ptrace_scope
    runInTerminal = false,
  }
}

-- default load .vscode/launch.json config
require('dap.ext.vscode').load_launchjs(nil, {})

dap.configurations.c = dap.configurations.cpp
dap.configurations.rust = dap.configurations.cpp