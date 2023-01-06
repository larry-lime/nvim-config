local status_ok, neozoom = pcall(require, "neo-zoom")
if not status_ok then
  return
end

neozoom.setup { -- use the defaults or UNCOMMENT and change any one to overwrite
  width_ratio = 1,
  height_ratio = 1,
  border = 'single',
}

local opts = { noremap = true, silent = true }
local keymap = vim.api.nvim_set_keymap

keymap('n', '<leader>z', ":NeoZoomToggle<CR>", opts)
