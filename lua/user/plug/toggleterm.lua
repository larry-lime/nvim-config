require 'toggleterm'.setup {
  shade_terminals = false,
  start_in_insert = true,
  direction = "horizontal", -- vertical, horizontal, tab, float
}

local Terminal = require('toggleterm.terminal').Terminal
local ipython  = Terminal:new({
  cmd = "ipython",
  hidden = true,
  start_in_insert = false,
  direction = "horizontal",
  -- float_opts = {
  --   border = "curved",
  -- },
})

local term = Terminal:new({
  -- cmd = "ipython",
  hidden = true,
  start_in_insert = true,
  direction = "float",
  float_opts = {
    border = "curved",
  },
})

local zsh1 = Terminal:new({
  -- cmd = "ipython",
  hidden = true,
  start_in_insert = true,
  direction = "horizontal",
  float_opts = {
    border = "curved",
  },
})

local zsh2 = Terminal:new({
  -- cmd = "ipython",
  hidden = true,
  start_in_insert = true,
  direction = "horizontal",
  float_opts = {
    border = "curved",
  },
})

local zsh3 = Terminal:new({
  -- cmd = "ipython",
  hidden = true,
  start_in_insert = true,
  direction = "horizontal",
  float_opts = {
    border = "curved",
  },
})

-- I should have made sure
local lua = Terminal:new({
  cmd = "lua",
  hidden = true,
  -- direction = "float",
  direction = "horizontal",
  float_opts = {
    border = "curved",
  },
})

local lazygit = Terminal:new({
  cmd = "lazygit",
  hidden = true,
  direction = "float",
  start_in_insert = true,
  float_opts = {
    border = "curved",
  },
})

function Lazygit()
  lazygit:toggle()
end

function Zsh_1_toggle()
  zsh1:toggle()
end

function Zsh_2_toggle()
  zsh2:toggle()
end

function Zsh_3_toggle()
  zsh3:toggle()
end

function Lua_toggle()
  lua:toggle()
end

function Term_toggle()
  term:toggle()
end

function Ipython_toggle()
  ipython:toggle()
end

-- LazyGit
vim.api.nvim_set_keymap("n", "<leader>lg", "<cmd>lua Lazygit()<CR>", { noremap = true, silent = true })

-- Float Termin
-- vim.api.nvim_set_keymap("n", "<A-t>", "<cmd>lua Term_toggle()<CR>", { noremap = true, silent = true })
-- vim.api.nvim_set_keymap("t", "<A-t>", "<C-\\><C-n><cmd>lua Term_toggle()<CR>", { noremap = true, silent = true })

-- Split Zsh Terminals
vim.api.nvim_set_keymap("n", "<A-1>", "<cmd>lua Zsh_1_toggle()<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<A-2>", "<cmd>lua Zsh_2_toggle()<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<A-3>", "<cmd>lua Zsh_3_toggle()<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("t", "<A-1>", "<C-\\><C-n><cmd>lua Zsh_1_toggle()<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("t", "<A-2>", "<C-\\><C-n><cmd>lua Zsh_2_toggle()<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("t", "<A-3>", "<C-\\><C-n><cmd>lua Zsh_3_toggle()<CR>", { noremap = true, silent = true })

-- Python Terminal
vim.api.nvim_set_keymap("t", "<A-p>", "<C-\\><C-n><cmd>lua Ipython_toggle()<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<A-p>", "<cmd>lua Ipython_toggle()<CR>", { noremap = true, silent = true })
