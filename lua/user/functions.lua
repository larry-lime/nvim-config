M = {}

local opts = { noremap = true, silent = true }
local keymap = vim.api.nvim_set_keymap
local execute = vim.api.nvim_exec

M.close_python = function() -- This is not working because of a weird autosave issue
  vim.g.ipython_open = false
  execute(":silent 1TermExec cmd='exit' go_back=0<CR>", true)
  keymap('n', '<leader>p1', ":lua require'user.functions'.run_file()<CR>", opts)
end

vim.g.ipython_open = false

M.open_python = function(func_name)
  vim.g.ipython_open = true
  keymap("n", "<leader>p1", ":1TermExec cmd='run %' go_back=0<CR>", opts) -- Remamps <leader>p1 to run the file in the runnig ipython terminal
  func_name()
end

-- M.toggle_ipython = function() -- Needed so the cursor doesn't jump

-- Run File
M.run_file = function(arg) -- TODO have this take arguments
  local filetype = vim.bo.filetype
  if filetype == 'python' then
    if vim.g.ipython_open == false then
      if arg == 1 then
        M.open_python(Ipython_spawn_h) -- Starts a new python terminal
        execute(":silent 1TermExec cmd='run %' go_back=0<CR>", true) -- Runs the file
        keymap("n", "<leader>p1", ":1TermExec cmd='run %' go_back=0<CR>", opts) -- Remamps <leader>p1 to run the file in the runnig ipython terminal
      end
      if arg == 2 then
        M.open_python(Ipython_spawn_v) -- Starts a new python terminal
        execute(":silent 2TermExec cmd='run %' go_back=0<CR>", true) -- Runs the file
        keymap("n", "<leader>p2", ":2TermExec cmd='run %' go_back=0<CR>", opts) -- Remamps <leader>p1 to run the file in the runnig ipython terminal
      end
      vim.g.ipython_open = true
    end
  end
end

return M
