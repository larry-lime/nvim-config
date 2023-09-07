local null_ls = require("null-ls")

null_ls.setup({
  sources = {
    -- formatting
    null_ls.builtins.formatting.black,
    null_ls.builtins.formatting.latexindent,
    null_ls.builtins.formatting.djlint,
    null_ls.builtins.formatting.prettier,

    -- diagnostics
    null_ls.builtins.diagnostics.ruff,

  },
})
