local api = vim.api
local formatter = api.nvim_create_augroup("formatter", { clear = true })
local commands = api.nvim_create_augroup("commands", { clear = true })

-- LSP Formatter
api.nvim_create_autocmd(
  { "Filetype" },
  { pattern = { "lua","html" }, command = "nnoremap <leader>F <cmd>execute 'lua vim.lsp.buf.format {async = true}'<CR>",
    group = formatter }
)

-- Prettier
api.nvim_create_autocmd(
  { "Filetype" },
  { pattern = { "javascript", "typescript", "solidity", "yaml" },
    command = "nnoremap <silent><leader>F :silent !prettier --write %<CR>",
    group = formatter }
)

-- Black
api.nvim_create_autocmd(
  { "Filetype" },
  { pattern = { "python" }, command = "nnoremap <silent><leader>F :silent !python3 -m black %<CR>", group = formatter }
)

api.nvim_create_autocmd(
  { "BufNewFile", "BufFilePre", "BufRead" },
  { pattern = { "*.conf" }, command = "set filetype=tmux",
    group = commands }
)

api.nvim_create_autocmd(
  { "VimResized" },
  { pattern = { "*" }, command = "wincmd =",
    group = commands }
)

api.nvim_create_autocmd(
  { "BufNewFile", "BufFilePre", "BufRead" },
  { pattern = { "*.conf" }, command = "set filetype=tmux",
    group = commands }
)

api.nvim_create_autocmd(
  { "Filetype" },
  { pattern = { "solidity" }, command = "setlocal expandtab tabstop=4 shiftwidth=4 softtabstop=4",
    group = commands }
)
