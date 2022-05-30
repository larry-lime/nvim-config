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
  vim.g.tokyonight_style = "night" --storm, night, day
  vim.g.tokyonight_dark_sidebar = false
end

if colorscheme == "onedark" then
  require("onedark").setup({
    hide_inactive_statusline = true,
    dark_sidebar = false,
    dark_float = false
  })
end

local status_ok, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)
if not status_ok then
  vim.notify("colorscheme " .. colorscheme .. " not found!")
  return
end
