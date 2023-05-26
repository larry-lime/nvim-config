local null_ls = require("null-ls")

null_ls.setup({
  sources = {
    -- formatting
    null_ls.builtins.formatting.ruff,
    null_ls.builtins.formatting.black,
    null_ls.builtins.formatting.djlint,
    null_ls.builtins.formatting.prettier,
    -- null_ls.builtins.formatting.markdownlint,

    -- diagnostics
    null_ls.builtins.diagnostics.ruff,

  },
})
