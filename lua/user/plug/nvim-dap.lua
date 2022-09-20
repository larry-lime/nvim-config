-- Dap Configurations
local dap, dapui = require("dap"), require("dapui")
dap.listeners.after.event_initialized["dapui_config"] = function()
  dapui.open()
end
dap.listeners.before.event_terminated["dapui_config"] = function()
  dapui.close()
end
dap.listeners.before.event_exited["dapui_config"] = function()
  dapui.close()
end

vim.fn.sign_define('DapBreakpoint', { text = '=>', texthl = '', linehl = '', numhl = '' })

-- Python Debugger
require("dap-python").setup("~/.virtualenvs/debugpy/bin/python") -- Only require this if I enter into a python file

-- Dap UI
dapui.setup({})
