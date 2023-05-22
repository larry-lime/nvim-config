local status_ok, gitsigns = pcall(require, "gitsigns")
if not status_ok then
  return
end

gitsigns.setup{}

local opts = { noremap = true, silent = true }
local keymap = vim.api.nvim_set_keymap

keymap("n", "]h", ":Gitsigns next_hunk<CR>", opts)
keymap("n", "[h", ":Gitsigns prev_hunk<CR>", opts)
keymap("n", "<leader>hp", ":Gitsigns preview_hunk<CR>", opts)
keymap("n", "<leader>hu", ":Gitsigns undo_stage_hunk<CR>", opts)
keymap("n", "<leader>hr", ":Gitsigns reset_hunk<CR>", opts)
keymap("n", "<leader>ha", ":Gitsigns stage_hunk<CR>", opts)
keymap("n", "<leader>gd", ":Gitsigns diffthis<CR>", opts)
