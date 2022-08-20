-- vim.api.nvim_exec(
--   [[
--     imap <silent><script><expr> <C-c> copilot#Accept("\<CR>")
--   ]], true)
-- vim.g.copilot_no_tab_map = "v:true"
-- vim.g.copilot_enabled = "v:false"

require("copilot").setup {
  cmp = {
    enabled = true,
    method = "getCompletionsCycling",
  },
  panel = {
    enabled = true,
  },
  ft_disable = { "markdown" },
  -- plugin_manager_path = vim.fn.stdpath "data" .. "/site/pack/packer",
  server_opts_overrides = {
    -- trace = "verbose",
    settings = {
      advanced = {
        listCount = 10, -- #completions for panel
        inlineSuggestCount = 3, -- #completions for getCompletions
      },
    },
  },
}
