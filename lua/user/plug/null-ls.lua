local null_ls = require("null-ls")

null_ls.setup({
  sources = {
    -- formatting
    null_ls.builtins.formatting.ruff,
    null_ls.builtins.formatting.black,

    -- diagnostics
    null_ls.builtins.diagnostics.ruff,

  },
})
