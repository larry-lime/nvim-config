local null_ls = require("null-ls")

null_ls.setup({
  sources = {
    -- formatting
    null_ls.builtins.formatting.black,
    null_ls.builtins.formatting.latexindent,
    -- null_ls.builtins.formatting.google_java_format,
    null_ls.builtins.formatting.djlint,
    null_ls.builtins.formatting.prettier,
    null_ls.builtins.formatting.forge_fmt,
    null_ls.builtins.formatting.beautysh,

    -- diagnostics
    null_ls.builtins.diagnostics.ruff,

  },
})
