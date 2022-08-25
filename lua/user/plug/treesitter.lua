-- TODO have treesitter tread ABI just like json files
require 'nvim-treesitter.configs'.setup {

  ensure_installed = { "python", "lua", "markdown", "norg" },

  sync_install = false,
  highlight = {
    enable = true,
    additional_vim_regex_highlighting = false,
  },
}
