-- TODO have treesitter tread ABI just like json files
require 'nvim-treesitter.configs'.setup {

  ensure_installed = { "python", "lua", "markdown", "solidity", "javascript", "rust", "typescript", "html", "css"},

  sync_install = false,
  highlight = {
    enable = true,
    additional_vim_regex_highlighting = false,
  },
}
