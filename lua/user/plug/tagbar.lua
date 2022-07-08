-- Variable Declarations
vim.g.tagbar_sort = 0

-- Keymaps
local keymap = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }

keymap("n", "<leader>tb", ":TagbarToggle<CR>", opts)
keymap("n", "]t", ":TagbarJumpNext<CR>", opts)
keymap("n", "[t", ":TagbarJumpPrev<CR>", opts)
keymap("n", "<leader>t<leader>b", ":TagbarOpen['j']<CR>", opts)
