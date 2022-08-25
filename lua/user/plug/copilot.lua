require("copilot").setup {
  cmp = {
    enabled = true,
    method = "getCompletionsCycling",
  },
  panel = {
    enabled = true,
  },
  ft_disable = { "markdown" },
  server_opts_overrides = {
    settings = {
      advanced = {
        listCount = 10,
        inlineSuggestCount = 3,
      },
    },
  },
}
