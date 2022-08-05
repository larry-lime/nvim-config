--    ______      __
--   / ____/___  / /___  __________
--  / /   / __ \/ / __ \/ ___/ ___/
-- / /___/ /_/ / / /_/ / /  (__  )
-- \____/\____/_/\____/_/  /____/

local colorscheme = "onedark" -- onedark, gruvbox, tokyonight, catppuccin

if colorscheme == "catppuccin" then
  vim.g.catppuccin_flavour = "macchiato" -- latte, frappe, macchiato, mocha
end

if colorscheme == "tokyonight" then
  vim.g.tokyonight_style = "storm" --storm, night, day
  vim.g.tokyonight_dark_sidebar = true
end

if colorscheme == "gruvbox" then
  vim.g.gruvbox_contrast_dark = 'medium' -- soft, medium, hard
  vim.g.gruvbox_contrast_light = 'medium' -- soft, medium, hard
  vim.g.gruvbox_sign_column = 'bg1'
end

if colorscheme == "onedark" then
  require("onedark").setup({
    hide_inactive_statusline = true,
    dark_sidebar = false,
    dark_float = false,
    transparent = false,
    transparent_sidebar = false,
  })
end

local status_ok, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)
if not status_ok then
  vim.notify("colorscheme " .. colorscheme .. " not found!")
  return
end
