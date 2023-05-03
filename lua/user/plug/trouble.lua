local status_ok, trouble = pcall(require, "trouble")
if not status_ok then
  return
end

trouble.setup()

local opts = { noremap = true, silent = true }
local keymap = vim.api.nvim_set_keymap

keymap('n', '<leader>E', ":Trouble<CR>", opts)
