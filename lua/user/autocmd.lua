local api = vim.api
local formatter = api.nvim_create_augroup("formatter", { clear = true })
local commands = api.nvim_create_augroup("commands", { clear = true })

-- LSP Formatter
api.nvim_create_autocmd(
  { "Filetype" },
  {
    pattern = { "*" },
    command = "nnoremap <leader>F <cmd>execute 'lua vim.lsp.buf.format {async = true}'<CR>",
    group = formatter
  }
)

-- Prettier
api.nvim_create_autocmd(
  { "Filetype" },
  {
    pattern = { "javascript", "typescript", "solidity", "yaml", "css", "scss" },
    command = "nnoremap <silent><leader>F :silent !npx prettier --write %<CR>",
    group = formatter
  }
)

-- Black
api.nvim_create_autocmd(
  { "Filetype" },
  { pattern = { "python" }, command = "nnoremap <silent><leader>F :silent !python3 -m black %<CR>", group = formatter }
)

-- Autosave
api.nvim_create_autocmd(
  { "InsertLeave", "TextChanged" },
  {
    -- Execute autocmd for all files except .tex files
    pattern = { "*" },
    command = "silent! write",
    group = commands
  }
)

-- Autosave
api.nvim_create_autocmd(
  { "InsertLeave", "TextChanged" },
  {
    -- Execute autocmd for all files except .tex files
    pattern = { "*.tex" },
    command = "TexlabBuild",
    group = commands
  }
)

-- Latex
api.nvim_create_autocmd(
  { "Filetype" },
  {
    pattern = { "tex" },
    command = "nnoremap <silent><leader>M :silent !open -a sioyek %:p:r.pdf<CR>",
    group = formatter
  }
)

api.nvim_create_autocmd(
  { "Filetype" },
  {
    pattern = { "tex" },
    -- Open filename with .pdf extension in sioyek.app
    command = "nnoremap <silent><leader>B :TexlabBuild<CR>",
    group = formatter
  }
)

api.nvim_create_autocmd(
  { "BufWritePost" },
  {
    pattern = { "*.tex" },
    command = "TexlabBuild",
    group = formatter
  }
)

-- Latex
api.nvim_create_autocmd(
  { "Filetype" },
  {
    pattern = { "tex" },
    -- Open filename with .pdf extension in sioyek.app
    command = "nnoremap <silent><leader>B :TexlabBuild<CR>",
    group = formatter
  }
)

-- Markdown
api.nvim_create_autocmd(
  { "Filetype" },
  {
    pattern = { "markdown" },
    command = "nnoremap <silent><leader>M :silent :MarkdownPreviewToggle<CR>",
    group = formatter
  }
)

api.nvim_create_autocmd(
  { "Filetype" },
  {
    pattern = { "csv", "json" },
    command = "set foldmethod=manual",
    group = formatter
  }
)

api.nvim_create_autocmd(
  { "Filetype" },
  {
    pattern = { "css", "html", "scss", "lua" },
    command = "ColorizerAttachToBuffer",
    group = formatter
  }
)


api.nvim_create_autocmd(
  { "BufNewFile", "BufFilePre", "BufRead" },
  {
    pattern = { "*.conf" },
    command = "set filetype=tmux",
    group = commands
  }
)

api.nvim_create_autocmd(
  { "VimResized" },
  {
    pattern = { "*" },
    command = "wincmd =",
    group = commands
  }
)

api.nvim_create_autocmd(
  { "Filetype" },
  {
    pattern = { "solidity" },
    command = "setlocal expandtab tabstop=4 shiftwidth=4 softtabstop=4",
    group = commands
  }
)
