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
  end
}

local Terminal = require('toggleterm.terminal').Terminal

local ipython_h = Terminal:new({
  hidden = true,
  cmd = "ipython",
  direction = "horizontal",
})

local ipython_v = Terminal:new({
  hidden = true,
  cmd = "ipython",
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

function Ipython_toggle_v()
  ipython_v:toggle()
end

-- Terminal
vim.api.nvim_set_keymap("n", "<A-1>", "<cmd>lua Term_toggle_1()<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("t", "<A-1>", "<C-\\><C-n><cmd>lua Term_toggle_1()<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<A-2>", "<cmd>lua Term_toggle_2()<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("t", "<A-2>", "<C-\\><C-n><cmd>lua Term_toggle_2()<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<A-3>", "<cmd>lua Term_toggle_3()<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("t", "<A-3>", "<C-\\><C-n><cmd>lua Term_toggle_3()<CR>", { noremap = true, silent = true })

vim.api.nvim_set_keymap("n", "<A-T>", "<cmd>lua Term_toggle_v()<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("t", "<A-T>", "<C-\\><C-n><cmd>lua Term_toggle_v()<CR>", { noremap = true, silent = true })

-- Ipython
vim.api.nvim_set_keymap("n", "<A-p>", "<cmd>lua Ipython_toggle_h()<CR>", { noremap = true, silent = true }) -- Horizontal
vim.api.nvim_set_keymap("t", "<A-p>", "<C-\\><C-n><cmd>lua Ipython_toggle_h()<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<leader>p1", "<cmd>1TermExec cmd='run %' go_back=0<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<A-P>", "<cmd>lua Ipython_toggle_v()<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("t", "<A-P>", "<C-\\><C-n><cmd>lua Ipython_toggle_v()<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<leader>p2", "<cmd>2TermExec cmd='run %' go_back=0<CR>", { noremap = true, silent = true })
