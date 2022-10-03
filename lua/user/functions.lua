M = {}

-- Open IPython
vim.g.ipython_open = false
M.open_python = function(func_name)
  vim.g.ipython_open = not vim.g.ipython_open
  func_name()
end

-- Run File
M.run_file = function()
  local filetype = vim.bo.filetype
  if filetype == 'python' then
    if vim.g.ipython_open == false then
      M.open_python(Ipython_spawn)
    end
    vim.api.nvim_exec(":silent 1TermExec cmd='run %' go_back=0<CR>", true)
    vim.g.ipython_open = true
  end
end
return M
