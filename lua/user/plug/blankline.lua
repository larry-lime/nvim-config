-- vim.opt.termguicolors = true
-- vim.opt.list = true
-- vim.opt.listchars:append "space:⋅"
-- vim.g.indent_blankline_filetype_exclude = {
--   "help",
--   "startify",
--   "dashboard",
--   "packer",
--   "neogitstatus",
--   "NvimTree",
--   "Trouble",
--   "text"
-- }
-- vim.opt.listchars:append "eol:↴"

require("ibl").setup {
  scope = { enabled = false },
}
-- vim.cmd [[highlight IndentBlanklineContextChar guifg=#707AA5 gui=nocombine]]
--
-- vim.api.nvim_exec(
--   [[
-- let g:indent_blankline_bufname_exclude = ['*\.md', '.*\.norg']
-- ]] , true)
