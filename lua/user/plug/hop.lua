local status_ok, hop = pcall(require, "hop")
if not status_ok then
  return
end

hop.setup()
--
-- TODO Move all the keymaps for specific plugins into the plugins files
-- KEYBOARD SHORTCUTS --
local opts = { noremap = true, silent = true }
local keymap = vim.api.nvim_set_keymap

keymap("n", "f", ":HopWord<CR>", opts)