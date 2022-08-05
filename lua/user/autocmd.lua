local api = vim.api

local formatter = api.nvim_create_augroup("formatter", { clear = true })
local commands = api.nvim_create_augroup("commands", { clear = true })

-- Formatters
-- LSP Formatter
api.nvim_create_autocmd(
  { "Filetype" },
  { pattern = { "*" }, command = "command! Format execute 'lua vim.lsp.buf.format {async = true}'", group = formatter }
)

-- Prettier
api.nvim_create_autocmd(
  { "Filetype" },
  { pattern = { "javascript", "typescript", "solidity" }, command = "command! Format execute 'Prettier'",
    group = formatter }
)

-- Black
api.nvim_create_autocmd(
  { "Filetype" },
  { pattern = { "python" }, command = "command! Format execute 'Black'",
    group = formatter }
)
-- Language Specific Commands
-- api.nvim_create_autocmd(
--   { "Filetype" },
--   { pattern = { "solidity" }, command = 'nnoremap <leader>rn yiw:s/<C-r>"/',
--     group = commands }
-- )
