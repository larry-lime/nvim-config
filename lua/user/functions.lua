M = {}

-- TODO: Figure out how to detect if a given terminal is open or now
local opts = { noremap = true, silent = true }
local keymap = vim.api.nvim_set_keymap
local execute = vim.api.nvim_exec

function M.close_python()
  vim.g.ipython_open = false
  execute(":silent 1TermExec cmd='exit' go_back=0<CR>", true)
  keymap('n', '<leader>p1', ":lua require'user.functions'.run_file()<CR>", opts)
end

vim.g.ipython_open = false

function M.open_python(func_name)
  vim.g.ipython_open = true
  if func_name == Ipython_spawn_h then
    keymap("n", "<leader>p1", ":1TermExec cmd='run %' go_back=0<CR>", opts) -- Remamps <leader>p1 to run the file in the runnig ipython terminal
  end
  if func_name == Ipython_spawn_v then
    keymap("n", "<leader>p2", ":2TermExec cmd='run %' go_back=0<CR>", opts) -- Remamps <leader>p1 to run the file in the runnig ipython terminal
  end
  func_name()
end

function M.toggle_sniprun()
  if vim.fn.exists "#_sniprun#TextChanged" == 0 then
    M.sniprun_enable()
  else
    M.disable_sniprun()
  end
end

function M.remove_augroup(name)
  if vim.fn.exists("#" .. name) == 1 then
    vim.cmd("au! " .. name)
  end
end

vim.cmd [[ command! SnipRunToggle execute 'lua require("user.functions").toggle_sniprun()' ]]

-- get length of current word
function M.get_word_length()
  local word = vim.fn.expand "<cword>"
  return #word
end

function M.toggle_option(option)
  local value = not vim.api.nvim_get_option_value(option, {})
  vim.opt[option] = value
  vim.notify(option .. " set to " .. tostring(value))
end

function M.toggle_tabline()
  local value = vim.api.nvim_get_option_value("showtabline", {})

  if value == 2 then
    value = 0
  else
    value = 2
  end

  vim.opt.showtabline = value

  vim.notify("showtabline" .. " set to " .. tostring(value))
end

local diagnostics_active = true
function M.toggle_diagnostics()
  diagnostics_active = not diagnostics_active
  if diagnostics_active then
    vim.diagnostic.show()
  else
    vim.diagnostic.hide()
  end
end

function M.isempty(s)
  return s == nil or s == ""
end

function M.get_buf_option(opt)
  local status_ok, buf_option = pcall(vim.api.nvim_buf_get_option, 0, opt)
  if not status_ok then
    return nil
  else
    return buf_option
  end
end

function M.smart_quit()
  local bufnr = vim.api.nvim_get_current_buf()
  local modified = vim.api.nvim_buf_get_option(bufnr, "modified")
  if modified then
    vim.ui.input({
      prompt = "You have unsaved changes. Quit anyway? (y/n) ",
    }, function(input)
      if input == "y" then
        vim.cmd "q!"
      end
    end)
  else
    vim.cmd "q!"
  end
end

-- M.toggle_ipython = function() -- Needed so the cursor doesn't jump

-- Run File
-- FIXME: Not working when terminal is opened first and then p1/p2 is ran
function M.run_file(arg)
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
