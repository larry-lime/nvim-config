local status_ok, refactor = pcall(require, "refactoring")
if not status_ok then
  return
end

refactor.setup({})
local opts = { noremap = true, silent = true }
local keymap = vim.api.nvim_set_keymap

keymap("v", "<leader>re", ":lua require('refactoring').refactor('Extract Function')<CR>", opts)
keymap("v", "<leader>rf", ":lua require('refactoring').refactor('Extract Function To File')<CR>", opts)
keymap("v", "<leader>rv", ":lua require('refactoring').refactor('Extract Variable')<CR>", opts)
keymap("v", "<leader>ri", ":lua require('refactoring').refactor('Inline Variable')<CR>", opts)
keymap("n", "<leader>rb", ":lua require('refactoring').refactor('Extract Block')<CR>", opts)
keymap("n", "<leader>rbf", ":lua require('refactoring').refactor('Extract Block To File')<CR>", opts)

