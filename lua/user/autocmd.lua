-- local api = vim.api
--
-- -- windows to close with "q"
-- api.nvim_create_autocmd(
--   "FileType",
--   { pattern = { "help", "startuptime", "qf", "lspinfo" }, command = [[nnoremap <buffer><silent> q :close<CR>]] }
-- )
-- api.nvim_create_autocmd("FileType", { pattern = "*.py", command = [[command Format Black]] })
vim.api.nvim_exec([[
augroup filetype_vimwiki
    autocmd!
    autocmd BufNewFile,BufFilePre,BufRead *.md set filetype=markdown
    autocmd FileType vimwiki nnoremap <silent> <leader>z :call FocusUpToggle()<CR>
augroup END
]], true)
