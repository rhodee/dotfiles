require("dapui").setup()
local dap = require("dap")

dap.adapters.lldb = {
  type  = "executable",
  command = "/usr/bin/lldb",
  name = "lldb",
}

dap.adapters.dlv = function(cb)
  cb({
    type  = "server",
    host = "127.0.0.1",
    port = 40000,
  })
end

dap.configurations.go = {
  {
    name = "Go-Debug",
    type = "go",
    request = "launch",
    program = "${file}",
    showLog = true,
  },
  {
    name = "Launch",
    type = "lldb",
    request = "launch",
    program = "${file}",
  }
}

dap.configurations.cpp = {
  {
    type = "dlv",
    request = "launch",
    program = function()
    end,
    cwd = "${workspaceFolder}",
    stopOnEntry = false,
    args = {},
    runInTerminal = true
  }
}

dap.configurations.rust = dap.configurations.cpp
