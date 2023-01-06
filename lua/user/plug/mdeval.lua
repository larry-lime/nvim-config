require 'mdeval'.setup({
  -- Don't ask before executing code blocks
  require_confirmation=false,
  -- Change code blocks evaluation options.
  eval_options = {
    python = {
      command = {"python3"}
    }
  },
})

local opts = { noremap = true, silent = true }
local keymap = vim.api.nvim_set_keymap

keymap('n', '<leader>md', ":MdEval<CR>", opts)
keymap('n', '<leader>mc', ":MdEvalClean<CR>", opts)
