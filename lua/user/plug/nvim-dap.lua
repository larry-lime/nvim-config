-- Dap Configurations
local dap, dapui = require("dap"), require("dapui")

dap.defaults.fallback.terminal_win_cmd = '20vsplit new'
dap.listeners.after.event_initialized["dapui_config"] = function()
  dapui.open()
end

-- dap.listeners.before.event_terminated["dapui_config"] = function()
--   dapui.close()
-- end
--
-- dap.listeners.before.event_exited["dapui_config"] = function()
--   dapui.close()
-- end

vim.fn.sign_define('DapBreakpoint', { text = '⭕', texthl = '', linehl = '', numhl = '' })

-- Python Debugger
require("dap-python").setup("~/.virtualenvs/debugpy/bin/python") -- Only require this if I enter into a python file
-- require("dap-vscode-js").setup({ adapters = { 'pwa-node' } })

-- dap.adapters['pwa-node'] = {
--   type = 'server',
--   host = '127.0.0.1',
--   port = 9999,
-- }
-- dap.configurations.javascript = {
--   {
--     type = "pwa-node",
--     request = "launch",
--     name = "Launch program",
--     program = "${file}",
--   }
-- }

-- dap.adapters.node2 = {
--   type = 'executable',
--   command = 'node',
--   args = { os.getenv('HOME') .. '/dev/microsoft/vscode-node-debug2/out/src/nodeDebug.js' },
-- }
-- dap.configurations.javascript = {
--   {
--     name = 'Launch',
--     type = 'node2',
--     request = 'launch',
--     program = '${file}',
--     cwd = vim.fn.getcwd(),
--     sourceMaps = true,
--     protocol = 'inspector',
--     console = 'integratedTerminal',
--   }
-- }

-- Dap UI
dapui.setup({})
