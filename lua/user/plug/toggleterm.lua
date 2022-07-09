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
  hide_numbers = true,
  direction = "horizontal",
})

local ipython_v = Terminal:new({
  hidden = true,
  cmd = "ipython",
  hide_numbers = true,
  direction = "vertical",
})

local term_v = Terminal:new({
  hidden = true,
  direction = "vertical",
})

local term_h = Terminal:new({
  hidden = true,
  direction = "horizontal",
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

function Term_toggle_h()
  term_h:toggle()
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

-- LazyGit
vim.api.nvim_set_keymap("n", "<leader>lg", "<cmd>lua Lazygit()<CR>", { noremap = true, silent = true }) -- Float

-- Terminal
vim.api.nvim_set_keymap("n", "<A-t>", "<cmd>lua Term_toggle_h()<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("t", "<A-t>", "<C-\\><C-n><cmd>lua Term_toggle_h()<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<A-T>", "<cmd>lua Term_toggle_v()<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("t", "<A-T>", "<C-\\><C-n><cmd>lua Term_toggle_v()<CR>", { noremap = true, silent = true })

-- Python
vim.api.nvim_set_keymap("n", "<A-p>", "<cmd>lua Ipython_toggle_h()<CR>", { noremap = true, silent = true }) -- Horizontal
vim.api.nvim_set_keymap("t", "<A-p>", "<C-\\><C-n><cmd>lua Ipython_toggle_h()<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<leader>p1", "<cmd>1TermExec cmd='run %' go_back=0<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<A-P>", "<cmd>lua Ipython_toggle_v()<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("t", "<A-P>", "<C-\\><C-n><cmd>lua Ipython_toggle_v()<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<leader>p2", "<cmd>2TermExec cmd='run %' go_back=0<CR>", { noremap = true, silent = true })
