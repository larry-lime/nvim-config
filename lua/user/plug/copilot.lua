vim.api.nvim_exec(
  [[
    imap <silent><script><expr> <C-c> copilot#Accept("\<CR>")
  ]], true)
vim.g.copilot_no_tab_map = "v:true"
vim.g.copilot_enabled = "v:false"
