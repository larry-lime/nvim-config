require('telescope').setup {
  defaults = {
    -- Default configuration for telescope goes here:
    -- config_key = value,
    layout_strategy = 'horizontal', -- vertical, horizontal, center, cursor, flex
    layout_config = {
      bottom_pane = {
        height = 25,
        preview_cutoff = 120,
        prompt_position = "top"
      },
      center = {
        height = 0.4,
        preview_cutoff = 40,
        prompt_position = "top",
        width = 0.5
      },
      cursor = {
        height = 0.4,
        preview_cutoff = 40,
        width = 0.5
      },
      horizontal = {
        height = 0.9,
        preview_cutoff = 120,
        preview_width = 0.5,
        prompt_position = "bottom",
        width = 0.8
      },
      vertical = {
        height = 0.9,
        preview_cutoff = 40,
        preview_height = 0.6,
        prompt_position = "bottom",
        width = 0.8
      },
    },
    mappings = {
      i = {
        -- map actions.which_key to <C-h> (default: <C-/>)
        -- actions.which_key shows the mappings for your picker,
        -- e.g. git_{create, delete, ...}_branch for the git_branches picker
        -- ["<C-h>"] = "which_key",
        ["<C-j>"] = require('telescope.actions').move_selection_next,
        ["<C-k>"] = require('telescope.actions').move_selection_previous,
        ["<C-n>"] = require('telescope.actions').preview_scrolling_down,
        ["<C-p>"] = require('telescope.actions').preview_scrolling_up,
        ["<C-d>"] = require('telescope.actions').delete_buffer,
      },
      n = {
        ["<C-n>"] = require('telescope.actions').preview_scrolling_down,
        ["<C-p>"] = require('telescope.actions').preview_scrolling_up,
      }
    }
  },
  pickers = {
    -- Default configuration for builtin pickers goes here:
    spell_suggest = {
      layout_strategy = 'cursor',
      layout_config = {
        width = 0.2,
        height = 0.3,
      }
    },
    --   picker_config_key = value,
    --   ...
    -- }
    -- Now the picker_config_key will be applied every time you call this
    -- builtin picker
  },
  extensions = {
    -- Your extension configuration goes here:
    -- extension_name = {
    --   extension_config_key = value,

    ['ui-select'] = {
      require("telescope.themes").get_dropdown {}
    },
  }
}

require("telescope").load_extension("ui-select")
require("telescope").load_extension("refactoring")
require("telescope").load_extension('harpoon')
-- require("telescope").load_extension("lsp_handlers")
-- require('telescope').load_extension('dap')
