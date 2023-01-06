require 'toggleterm'.setup {

  shade_terminals = false,
  start_in_insert = true,
  -- persist_mode = false,
  size = function(term)
    if term.direction == "horizontal" then
      return 15
    elseif term.direction == "vertical" then
      return 70
    end
  end,
  winbar = {
    enabled = false,
    name_formatter = function(term) --  term: Terminal
      return term.name
    end
  }
}

local Terminal = require('toggleterm.terminal').Terminal

local ipython_h = Terminal:new({
  hidden = true,
  cmd = "ipython --no-banner",
  direction = "horizontal",
})

local ipython_v = Terminal:new({
  hidden = true,
  cmd = "ipython --no-banner",
  direction = "vertical",
})

local term_v = Terminal:new({
  hidden = true,
  direction = "vertical",
})

local term_1 = Terminal:new({
  hidden = true,
  direction = "horizontal",
})

local term_2 = Terminal:new({
  hidden = true,
  direction = "horizontal",
})

local term_3 = Terminal:new({
  hidden = true,
  direction = "horizontal",
})

function Term_toggle_1()
  term_1:toggle()
end

function Term_toggle_2()
  term_2:toggle()
end

function Term_toggle_3()
  term_3:toggle()
end

function Term_toggle_v()
  term_v:toggle()
end

function Ipython_toggle_h()
  ipython_h:toggle()
end

function Ipython_spawn_h()
  ipython_h:spawn()
end

function Ipython_spawn_v()
  ipython_v:spawn()
end

function Ipython_toggle_v()
  ipython_v:toggle()
end

local opts = { noremap = true, silent = true }
local keymap = vim.api.nvim_set_keymap

-- Run Python
keymap('n', '<leader>p1', ":lua require'user.functions'.run_file(1)<CR>", opts)
keymap('n', '<leader>p2', ":lua require'user.functions'.run_file(2)<CR>", opts)
keymap('n', '<leader>pd', ":lua require'user.functions'.close_python()<CR>", opts)

-- Open Terminal
keymap("n", "<M-1>", ":silent lua Term_toggle_1()<CR>", opts)
keymap("t", "<M-1>", "<C-\\><C-n>:lua Term_toggle_1()<CR>", opts)
keymap("n", "<M-2>", ":lua Term_toggle_2()<CR>", opts)
keymap("t", "<M-2>", "<C-\\><C-n>:lua Term_toggle_2()<CR>", opts)
keymap("n", "<M-3>", ":lua Term_toggle_3()<CR>", opts)
keymap("t", "<M-3>", "<C-\\><C-n>:lua Term_toggle_3()<CR>", opts)

-- Open Ipython Terminal
keymap("n", "<M-p>", ":silent lua require'user.functions'.open_python(Ipython_toggle_h)<CR>", opts)
keymap("t", "<M-p>", "<C-\\><C-n>:lua require'user.functions'.open_python(Ipython_toggle_h)<CR>", opts)
keymap("n", "<M-P>", ":silent lua require'user.functions'.open_python(Ipython_toggle_v)<CR>", opts)
keymap("t", "<M-P>", "<C-\\><C-n>:lua require'user.functions'.open_python(Ipython_toggle_v)<CR>", opts)
