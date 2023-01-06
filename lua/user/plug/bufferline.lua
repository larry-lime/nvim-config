vim.opt.termguicolors = true
require("bufferline").setup {
  options = {
    mode = "buffers", -- set to "tabs" to only show tabpages instead
    numbers = "ordinal", --[[ | "ordinal" | "buffer_id" | "both" | function({ ordinal, id, lower, raise }): string, ]]
    modified_icon = '●',
    indicator = {
      icon = '▎', -- this should be omitted if indicator style is not 'icon'
      style = 'icon'
    },
    offsets = {
      {
        filetype = "NvimTree",
        text = "File Explorer",
        text_align = "center",
        separator = true
      }
    },
    separator_style = "thin" --[[ "slant" | "thick" | "thin" | { 'any', 'any' }, ]]
  },
}

local opts = { noremap = true, silent = true }
local keymap = vim.api.nvim_set_keymap

keymap("n", "<leader>1", ":lua require('bufferline').go_to_buffer(1, true)<cr>", opts)
keymap("n", "<leader>2", ":lua require('bufferline').go_to_buffer(2, true)<cr> ", opts)
keymap("n", "<leader>3", ":lua require('bufferline').go_to_buffer(3, true)<cr> ", opts)
keymap("n", "<leader>4", ":lua require('bufferline').go_to_buffer(4, true)<cr> ", opts)
keymap("n", "<leader>5", ":lua require('bufferline').go_to_buffer(5, true)<cr> ", opts)
keymap("n", "<leader>6", ":lua require('bufferline').go_to_buffer(6, true)<cr> ", opts)
keymap("n", "<leader>7", ":lua require('bufferline').go_to_buffer(7, true)<cr> ", opts)
