require("copilot").setup {
  cmp = {
    enabled = true,
    method = "getCompletionsCycling",
    -- method = "getPanelCompletions",
  },
  panel = {
    enabled = false,
  }
}
