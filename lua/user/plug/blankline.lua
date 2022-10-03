require("indent_blankline").setup {
  show_current_context = false,
  show_current_context_start = false,
}

vim.api.nvim_exec(
  [[
let g:indent_blankline_bufname_exclude = ['*\.md', '.*\.norg']
]] , true)
