require('lualine').setup {
  options = {
    icons_enabled = true,
    theme = 'auto',
    -- component_separators = { left = '', right = '' },
    -- section_separators = { left = '', right = '' },
    component_separators = { left = '|', right = '|' },
    section_separators = { left = '', right = '' },
    disabled_filetypes = {},
    always_divide_middle = true,
    globalstatus = true,
  },
  sections = {
    lualine_a = { 'mode' },
    lualine_b = { 'branch', 'diff', 'diagnostics' },
    lualine_c = { 'filename' },
    lualine_x = { 'encoding', 'fileformat', 'filetype' },
    lualine_y = {},
    lualine_z = { '%l/%L' },
  },
  tabline = {
    lualine_a = {
      { 'tabs', max_length = vim.o.columns, mode = 2, }
    },
    lualine_b = {},
    lualine_c = {},
    -- lualine_x = { 'os.date()' },
    lualine_x = {},
    lualine_y = {},
    lualine_z = {
      -- {'buffers', mode=0}
    }
  },
      -- require('lualine').hide({
      --   place = {'statusline', 'tabline', 'winbar'}, -- The segmentthis change applies to.
      --   unhide = false,  -- whether to reenable lualine again/
      -- })
  extensions = {}
}
