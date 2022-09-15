vim.api.nvim_exec(
  [[
    imap <silent><script><expr> <C-c> copilot#Accept("\<CR>")
  ]], true)
vim.g.copilot_no_tab_map = "v:true"
vim.g.copilot_enabled = "v:false"

-- require("copilot").setup {
--   cmp = {
--     enabled = true,
--     method = "getCompletionsCycling",
--   },
--   panel = {
--     enabled = true,
--   },
--   ft_disable = { "markdown" },
--   server_opts_overrides = {
--     settings = {
--       advanced = {
--         listCount = 10,
--         inlineSuggestCount = 3,
--       },
--     },
--   },
-- }


