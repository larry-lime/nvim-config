require 'nvim-treesitter.configs'.setup {

  ensure_installed = { "python", "lua", "solidity", "javascript", "rust", "typescript", "html", "css" },

  sync_install = false,
  highlight = {
    enable = true,
    additional_vim_regex_highlighting = false,
  },
  matchup = {
    enable = true, -- mandatory, false will disable the whole extension
    disable_virtual_text = true,
    disable = { "html" }, -- optional, list of language that will be disabled
    -- include_match_words = false
  },

}
