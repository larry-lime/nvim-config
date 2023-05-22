require("symbols-outline").setup {
  autofold_depth = 1,
  width = 20,
}

local opts = { noremap = true, silent = true }
local keymap = vim.api.nvim_set_keymap

keymap("n", "<leader>tb", ":SymbolsOutline<CR>", opts)
-- keymap("n", "<leader>nv", ":AerialToggle float<CR>", opts)
-- keymap("n", "]f", ":AerialNext<CR>", opts)
-- keymap("n", "[f", ":AerialPrev<CR>", opts)
