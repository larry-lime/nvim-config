vim.opt.termguicolors = true
require("bufferline").setup {
  options = {
    mode = "buffers", -- set to "tabs" to only show tabpages instead
    numbers = "ordinal", --[[ | "ordinal" | "buffer_id" | "both" | function({ ordinal, id, lower, raise }): string, ]]
    modified_icon = '●',
    indicator = {
      icon = '▎', -- this should be omitted if indicator style is not 'icon'
      style = 'icon'
    },
    truncate_names = false, -- whether or not tab names should be truncated
    offsets = {
      {
        filetype = "NvimTree",
        text = "File Explorer",
        text_align = "center",
        separator = true
      }
    },
    separator_style = "thin", --[[ "slant" | "thick" | "thin" | { 'any', 'any' }, ]]
  },
}
