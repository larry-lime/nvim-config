--    ______      __
--   / ____/___  / /___  __________
--  / /   / __ \/ / __ \/ ___/ ___/
-- / /___/ /_/ / / /_/ / /  (__  )
-- \____/\____/_/\____/_/  /____/

local colorscheme = "tokyonight" -- onedark, gruvbox, tokyonight, catppuccin

if colorscheme == "catppuccin" then
  require("catppuccin").setup({
    flavour = "macchiato", -- latte, frappe, macchiato, mocha
    background = {
                       -- :h background
      light = "latte",
      dark = "mocha",
    },
    transparent_background = false,
    show_end_of_buffer = false, -- show the '~' characters after the end of buffers
    term_colors = false,
    dim_inactive = {
      enabled = false,
      shade = "dark",
      percentage = 0.15,
    },
    no_italic = false,    -- Force no italic
    no_bold = false,      -- Force no bold
    no_underline = false, -- Force no underline
    styles = {
      comments = { "italic" },
      conditionals = { "italic" },
      loops = {},
      functions = {},
      keywords = {},
      strings = {},
      variables = {},
      numbers = {},
      booleans = {},
      properties = {},
      types = {},
      operators = {},
    },
    color_overrides = {},
    custom_highlights = {},
    integrations = {
      cmp = true,
      gitsigns = true,
      nvimtree = true,
      telescope = true,
      notify = false,
      mini = false,
      -- For more plugins integrations please scroll down (https://github.com/catppuccin/nvim#integrations)
    },
  })
end

if colorscheme == "tokyonight" then
  require("tokyonight").setup({
    -- your configuration comes here
    -- or leave it empty to use the default settings
    style = "night",         -- The theme comes in three styles, `storm`, `moon`, a darker variant `night` and `day`
    light_style = "day",     -- The theme is used when the background is set to light
    transparent = false,     -- Enable this to disable setting the background color
    terminal_colors = false, -- Configure the colors used when opening a `:terminal` in Neovim
    styles = {
      -- Style to be applied to different syntax groups
      -- Value is any valid attr-list value for `:help nvim_set_hl`
      comments = { italic = true },
      keywords = { italic = true },
      functions = {},
      variables = {},
      -- Background styles. Can be "dark", "transparent" or "normal"
      sidebars = "dark",              -- style for sidebars, see below
      floats = "dark",                -- style for floating windows
    },
    sidebars = { "qf", "help" },      -- Set a darker background on sidebar-like windows. For example: `["qf", "vista_kind", "terminal", "packer"]`
    day_brightness = 0.3,             -- Adjusts the brightness of the colors of the **Day** style. Number between 0 and 1, from dull to vibrant colors
    hide_inactive_statusline = false, -- Enabling this option, will hide inactive statuslines and replace them with a thin border instead. Should work with the standard **StatusLine** and **LuaLine**.
    dim_inactive = false,             -- dims inactive windows
    lualine_bold = true,              -- When `true`, section headers in the lualine theme will be bold
  })
end


if colorscheme == "monokai" then
  require('monokai').setup { palette = require('monokai').pro }
end

if colorscheme == "nord" then
  vim.g.nord_contrast = true
  vim.g.nord_borders = false
  vim.g.nord_disable_background = false
  vim.g.nord_italic = false
  vim.g.nord_uniform_diff_background = true
  vim.g.nord_bold = false
end

if colorscheme == "gruvbox" then
  require("gruvbox").setup({
    undercurl = true,
    underline = true,
    bold = true,
    italic = true,
    strikethrough = true,
    invert_selection = true,
    invert_signs = false,
    invert_tabline = false,
    invert_intend_guides = false,
    inverse = true,    -- invert background for search, diffs, statuslines and errors
    contrast = "hard", -- can be "hard", "soft" or empty string
    palette_overrides = {},
    overrides = {},
    dim_inactive = false,
    transparent_mode = true,
  })
  vim.o.background = "dark" -- or "light" for light mode
  vim.cmd([[colorscheme gruvbox]])
end

if colorscheme == "onedark" then
  -- Lua
  require('onedark').setup {
    -- Main options --
    style = 'cool',               -- Default theme style. Choose between 'dark', 'darker', 'cool', 'deep', 'warm', 'warmer' and 'light'
    transparent = false,          -- Show/hide background
    term_colors = true,           -- Change terminal color as per the selected theme style
    ending_tildes = false,        -- Show the end-of-buffer tildes. By default they are hidden
    cmp_itemkind_reverse = false, -- reverse item kind highlights in cmp menu

    -- toggle theme style ---
    toggle_style_key = nil,                                                              -- keybind to toggle theme style. Leave it nil to disable it, or set it to a string, for example "<leader>ts"
    toggle_style_list = { 'dark', 'darker', 'cool', 'deep', 'warm', 'warmer', 'light' }, -- List of styles to toggle between

    -- Change code style ---
    -- Options are italic, bold, underline, none
    -- You can configure multiple style with comma seperated, For e.g., keywords = 'italic,bold'
    code_style = {
      comments = 'italic',
      keywords = 'none',
      functions = 'none',
      strings = 'none',
      variables = 'none'
    },

    -- Lualine options --
    lualine = {
      transparent = false, -- lualine center bar transparency
    },

    -- Custom Highlights --
    colors = {},     -- Override default colors
    highlights = {}, -- Override highlight groups

    -- Plugins Config --
    diagnostics = {
      darker = true,     -- darker colors for diagnostic
      undercurl = true,  -- use undercurl instead of underline for diagnostics
      background = true, -- use background color for virtual text
    },
  }
end

local status_ok, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)
if not status_ok then
  vim.notify("colorscheme " .. colorscheme .. " not found!")
  return
end
