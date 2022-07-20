local api = vim.api

local defaults = api.nvim_create_augroup("defaults", { clear = true })
api.nvim_create_autocmd(
  { "Filetype" },
  { pattern = { "*" }, command = "command! Format execute 'lua vim.lsp.buf.format {async = true}'", group = defaults }
)
api.nvim_create_autocmd(
  { "Filetype" },
  { pattern = { "javascript", "typescript", "solidity", "python" }, command = "command! Format execute 'Neoformat'",
    group = defaults }
)
