vim.opt.termguicolors = true
vim.opt.list = true
vim.opt.listchars:append "space:⋅"
-- vim.opt.listchars:append "eol:↴"

require("indent_blankline").setup {
  show_current_context = false,
  show_current_context_start = false,
  show_end_of_line = true,
  space_char_blankline = " ",
  buftype_exclude = { "terminal","NvimTree" },
  context_patterns = {
    "class", "return", "function", "method", "^if", "^while", "jsx_element", "^for", "^object",
    "^table", "block", "arguments", "if_statement", "else_clause", "jsx_element",
    "jsx_self_closing_element", "try_statement", "catch_clause", "import_statement",
    "operation_type"
  }
}
vim.cmd [[highlight IndentBlanklineContextChar guifg=#707AA5 gui=nocombine]]

vim.api.nvim_exec(
  [[
let g:indent_blankline_bufname_exclude = ['*\.md', '.*\.norg']
]] , true)
