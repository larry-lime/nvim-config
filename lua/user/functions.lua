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

function M.open_tex()
  local pdf_file = vim.fn.expand "%:p:r" .. ".pdf"
  if vim.fn.filereadable(pdf_file) == 1 then
    vim.cmd("silent !open -a sioyek.app " .. pdf_file)
  else
    vim.lsp.buf.execute_command { command = "TexlabBuild", arguments = { 1 } }
    vim.cmd("silent !open -a sioyek.app " .. pdf_file)
  end
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

function M.run_selection()
  -- Get the current visual selection
  local start_line, start_col, end_line, end_col = vim.fn.getpos("'<")[2], vim.fn.getpos("'<")[3], vim.fn.getpos("'>")
      [2], vim.fn.getpos("'>")[3]
  local lines = vim.fn.getline(start_line, end_line)
  lines[#lines] = string.sub(lines[#lines], 1, end_col - 1)
  lines[1] = string.sub(lines[1], start_col)

  -- Join the lines into a single string without newlines
  local text = table.concat(lines, " ")

  -- Copy the text to the specified register
  local reg = '"'
  vim.fn.setreg(reg, text, 'v')

  local output = vim.fn.system('mycli -uroot -t university -e ' .. vim.fn.shellescape(text))
  require("notify")(output, vim.log.levels.OFF,
    {
      title = "MySQL",
      timeout = false,
      background_colour = "NotifyBackground",
      top_down = true,
    })
end

-- Allow it to take in a filetype, filename
function M.run_file(arg)
  -- Detect filetype
  local filetype = vim.bo.filetype
  local filename = vim.fn.expand "%:p"
  local output = ""
  local replace_notifs = false
  local notify_options = {
    title = filetype,
    timeout = 60000, -- 1 minute
    background_colour = "NotifyBackground",
    top_down = true,
  }
  if filetype == "sql" then
    -- Run python file
    output = vim.fn.system('mycli -uroot -t ' .. vim.fn.shellescape(arg) .. ' < ' .. vim.fn.shellescape(filename))
    notify_options.title = "MySQL"
  elseif filetype == "python" then -- Run python file
    output = vim.fn.system('python3 ' .. vim.fn.shellescape(filename))
  elseif filetype == "c" then
    output = vim.fn.system('gcc -Wall ' .. vim.fn.shellescape(filename) .. ' && ./a.out')
    vim.fn.system('rm a.out')
  elseif filetype == "javascript" then
    output = vim.fn.system('node ' .. vim.fn.shellescape(filename))
  end

  -- Use vim.notify to display the output
  if replace_notifs then
    require("notify").dismiss({ silent = true })
  end
  require("notify")(output, vim.log.levels.OFF, notify_options)
end

return M
