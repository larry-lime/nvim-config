local status_ok, alpha = pcall(require, "alpha")
if not status_ok then
  return
end

local dashboard = require("alpha.themes.dashboard")

local function button(sc, txt, keybind, keybind_opts)
  local b = dashboard.button(sc, txt, keybind, keybind_opts)
  b.opts.hl_shortcut = "Macro"
  return b
end

dashboard.section.header.val = {
  [[                               __                ]],
  [[  ___     ___    ___   __  __ /\_\    ___ ___    ]],
  [[ / _ `\  / __`\ / __`\/\ \/\ \\/\ \  / __` __`\  ]],
  [[/\ \/\ \/\  __//\ \_\ \ \ \_/ |\ \ \/\ \/\ \/\ \ ]],
  [[\ \_\ \_\ \____\ \____/\ \___/  \ \_\ \_\ \_\ \_\]],
  [[ \/_/\/_/\/____/\/___/  \/__/    \/_/\/_/\/_/\/_/]],
}

local icons = require "user.icons"
dashboard.section.buttons.val = {
  button("f", icons.documents.Files .. " Find file", ":Telescope find_files <CR>"),
  button("e", icons.ui.NewFile .. " New file", ":ene <BAR> startinsert <CR>"),
  button("r", icons.ui.History .. " Recent files", ":Telescope oldfiles <CR>"),
  button("t", icons.ui.List .. " Find text", ":Telescope live_grep <CR>"),
  button("s", icons.ui.SignIn .. " Load Session", ":RestoreSession<CR>"),
  button("c", icons.ui.Gear .. " Config", ":e ~/.config/nvim/init.lua <CR>"),
  button("q", icons.ui.SignOut .. " Quit", ":qa<CR>"),
}
alpha.setup(require 'alpha.themes.dashboard'.config)

dashboard.section.footer.val = "larrylime"

dashboard.section.header.opts.hl = "Include"
dashboard.section.buttons.opts.hl = "Macro"
dashboard.section.footer.opts.hl = "Type"
dashboard.opts.opts.noautocmd = true
alpha.setup(dashboard.opts)
