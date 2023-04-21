vim.api.nvim_exec(
  [[
    imap <silent><script><expr> <C-c> copilot#Accept("\<CR>")
  ]], true)
vim.g.copilot_no_tab_map = "v:true"
vim.g.copilot_enabled = "v:false"

-- Execute vim script
vim.api.nvim_exec(
  [[
    let g:copilot_filetypes = {
          \ 'markdown': v:true,
          \ }
  ]], true)

local opts = { noremap = true, silent = true }
local keymap = vim.api.nvim_set_keymap
keymap("n", "<leader>ce", ":Copilot enable<CR>", opts)
keymap("n", "<leader>cd", ":Copilot disable<CR>", opts)
keymap("n", "<leader>cp", ":Copilot panel<CR>", opts)
keymap("n", "<leader>cs", ":echo g:copilot#Enabled()<CR>", opts)
