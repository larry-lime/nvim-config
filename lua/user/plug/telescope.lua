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
    spell_suggest = {
      layout_strategy = 'cursor',
      layout_config = {
        width = 0.2,
        height = 0.3,
      }
    },
    find_files = {
      hidden = false,
      no_ignore = false,
    },
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

local opts = { noremap = true, silent = true }
local keymap = vim.api.nvim_set_keymap

keymap("n", "<leader>tl", ":Telescope<CR>", opts)
keymap("n", "<leader>ff", ":Telescope find_files<CR>", opts)
keymap("n", "<leader>fi", ":Telescope current_buffer_fuzzy_find<CR>", opts)
keymap("n", "<leader>cl", ":Telescope colorscheme<CR>", opts)
keymap("n", "<leader>bl", ":Telescope buffers<CR>", opts)
keymap("n", "<leader>rg", ":Telescope live_grep<CR>", opts)
keymap("n", "<leader>rs", ":Telescope resume<CR>", opts)
keymap("n", "<leader>jl", ":Telescope jumplist<CR>", opts)
keymap("n", "<leader>mp", ":Telescope keymaps<CR>", opts)
keymap("n", "<leader>sc", ":Telescope spell_suggest<CR>", opts)
keymap("n", "<leader>hl", ":Telescope help_tags<CR>", opts)
keymap("n", "<leader>gs", ":Telescope git_status<CR>", opts)

-- Notes
-- keymap("n", "<leader>td", ":lua require('telescope.builtin').grep_string({prompt_title='TODOs',search='TODO'})<CR>", opts)
-- keymap("n", "<leader>fx", ":lua require('telescope.builtin').grep_string({prompt_title='FIXMEs',search='FIXME:'})<CR>",
--   opts)
-- keymap("n", "<leader>ne", ":lua require('telescope.builtin').grep_string({prompt_title='NOTEs',search='NOTE:'})<CR>",
--   opts)
