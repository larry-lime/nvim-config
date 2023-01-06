-- Dap Configurations
local dap_status_ok, dap = pcall(require, "dap")
if not dap_status_ok then
  return
end

local dap_ui_status_ok, dapui = pcall(require, "dapui")
if not dap_ui_status_ok then
  return
end

-- Python Config
dap.adapters.python = {
  type = 'executable';
  command = '/Users/lawrencelim/.virtualenvs/debugpy/bin/python';
  args = { '-m', 'debugpy.adapter' };
}

dap.configurations.python = {
  {
    -- The first three options are required by nvim-dap
    type = 'python';
    request = 'launch';
    name = "Launch file";

    -- Options below are for debugpy, see https://github.com/microsoft/debugpy/wiki/Debug-configuration-settings for supported options
    program = "${file}"; -- This configuration will launch the current file if used.
    pythonPath = function()
      -- debugpy supports launching an application with a different interpreter then the one used to launch debugpy itself.
      -- The code below looks for a `venv` or `.venv` folder in the current directly and uses the python within.
      -- You could adapt this - to for example use the `VIRTUAL_ENV` environment variable.
      local cwd = vim.fn.getcwd()
      if vim.fn.executable(cwd .. '/venv/bin/python') == 1 then
        return cwd .. '/venv/bin/python'
      elseif vim.fn.executable(cwd .. '/.venv/bin/python') == 1 then
        return cwd .. '/.venv/bin/python'
      else
        return '/opt/homebrew/bin/python3'
      end
    end;
  },
}

dap.adapters.node2 = {
  type = 'executable',
  command = 'node',
  args = { os.getenv('HOME') .. '/dev/microsoft/vscode-node-debug2/out/src/nodeDebug.js' },
}

dap.configurations.javascript = {
  {
    type = 'node2',
    request = 'launch',
    name = 'Launch',
    program = '${file}',
    cwd = vim.fn.getcwd(),
    sourceMaps = true,
    protocol = 'inspector',
    console = 'integratedTerminal',
  }
}


-- Only starts the dapui if there is an exception or breakpoint
dap.listeners.after.event_stopped["dap.run_to_cursor"] = function()
  dapui.open()
end
dap.listeners.before.event_terminated["dapui_config"] = function()
  dapui.close()
end
dap.listeners.before.event_exited["dapui_config"] = function()
  dapui.close()
end

-- Enable running with and without debugging
local icons = require("user.icons")

vim.fn.sign_define("DapBreakpoint", { text = icons.ui.Bug, texthl = "DiagnosticSignError", linehl = "", numhl = "" })

-- Dap UI
dapui.setup({
  -- icons = { expanded = "", collapsed = "", current_frame = "" },
    icons = { expanded = "", collapsed = "", current_frame = "" },
  controls = {
    -- Requires Neovim nightly (or 0.8 when released)
    enabled = true,
    -- Display controls in this element
    element = "repl",
    icons = {
      pause = "",
      play = "",
      step_into = "",
      step_over = "",
      step_out = "",
      step_back = "",
      run_last = "",
      terminate = "",
    },
  },
})

local nopts = { noremap = true, silent = false }
local opts = { noremap = true, silent = true }
local keymap = vim.api.nvim_set_keymap

-- Nvim-Dap
keymap("n", "<leader>ds", ":silent lua require'dap'.continue()<CR>", opts)
keymap("n", "<F5>", ":silent lua require'dap'.continue()<CR>", opts)
keymap("n", "<leader>de", ":lua require'dap'.disconnect()<CR>", opts)
keymap("n", "<leader>.", ":lua require'dap'.toggle_breakpoint()<CR>", opts)
keymap("n", "<leader>bc", ":lua require'dap'.clear_breakpoints()<CR>", opts)
keymap("n", "<F5>", ":lua require'dap'.continue()<CR>", nopts)
keymap("n", "<F9>", ":lua require'dap'.step_into()<CR>", opts)
keymap("n", "<F10>", ":lua require'dap'.step_over()<CR>", opts)
keymap("n", "<F11>", ":lua require'dap'.step_out()<CR>", opts)
keymap("n", "<F12>", ":lua require'dap'.step_back()<CR>", opts)
