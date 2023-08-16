require 'nvim-treesitter.configs'.setup {

  ensure_installed = { "python", "lua", "solidity", "javascript", "rust", "typescript", "html", "css", "help" },

  sync_install = false,
  highlight = {
    enable = true,
    disable = function(lang, bufnr) -- Disable in large C++ buffers
      return lang == "*" and api.nvim_buf_line_count(bufnr) > 50000
    end,
    additional_vim_regex_highlighting = false,
  },
  matchup = {
    enable = true,        -- mandatory, false will disable the whole extension
    disable_virtual_text = false,
    disable = { "html" }, -- optional, list of language that will be disabled
    -- include_match_words = false
  },
  pairs = {
    enable = true,
    disable = {},
    highlight_pair_events = {},                                   -- e.g. {"CursorMoved"}, -- when to highlight the pairs, use {} to deactivate highlighting
    highlight_self = false,                                       -- whether to highlight also the part of the pair under cursor (or only the partner)
    goto_right_end = false,                                       -- whether to go to the end of the right partner or the beginning
    fallback_cmd_normal = "call matchit#Match_wrapper('',1,'n')", -- What command to issue when we can't find a pair (e.g. "normal! %")
    keymaps = {
      goto_partner = "<leader>%",
      delete_balanced = "X",
    },
    delete_balanced = {
      only_on_first_char = false, -- whether to trigger balanced delete when on first character of a pair
      fallback_cmd_normal = nil,  -- fallback command when no pair found, can be nil
      longest_partner = false,    -- whether to delete the longest or the shortest pair when multiple found.
      -- E.g. whether to delete the angle bracket or whole tag in  <pair> </pair>
    }
  },
  textobjects = {
    move = {
      enable = true,
      set_jumps = true, -- whether to set jumps in the jumplist
      goto_next_start = {
        ["]m"] = "@function.outer",
        ["]]"] = { query = "@class.outer", desc = "Next class start" },
        --
        -- You can use regex matching and/or pass a list in a "query" key to group multiple queires.
        ["]o"] = "@loop.*",
        -- ["]o"] = { query = { "@loop.inner", "@loop.outer" } }
        --
        -- You can pass a query group to use query from `queries/<lang>/<query_group>.scm file in your runtime path.
        -- Below example nvim-treesitter's `locals.scm` and `folds.scm`. They also provide highlights.scm and indent.scm.
        ["]s"] = { query = "@scope", query_group = "locals", desc = "Next scope" },
        ["]z"] = { query = "@fold", query_group = "folds", desc = "Next fold" },
      },
      goto_next_end = {
        ["]M"] = "@function.outer",
        ["]["] = "@class.outer",
      },
      goto_previous_start = {
        ["[m"] = "@function.outer",
        ["[["] = "@class.outer",
      },
      goto_previous_end = {
        ["[M"] = "@function.outer",
        ["[]"] = "@class.outer",
      },
      -- Below will go to either the start or the end, whichever is closer.
      -- Use if you want more granular movements
      -- Make it even more gradual by adding multiple queries and regex.
      goto_next = {
        ["]c"] = "@conditional.outer",
      },
      goto_previous = {
        ["[c"] = "@conditional.outer",
      }
    },
  }
}
