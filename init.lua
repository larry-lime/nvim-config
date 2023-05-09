--     ____      _ __
--    /  _/___  (_) /_
--    / // __ \/ / __/
--  _/ // / / / / /_
-- /___/_/ /_/_/\__/

-- General Configs
require("user.options")
require("user.plugins")
require("user.keymaps")
require("user.cmp")
require("user.colors")
require("user.lsp")
require("user.autocmd")
require("user.functions")
require("user.snippets")

-- Default Plugin Configs
require("Comment").setup()
require("Comment").setup()
require("notify").setup({ fps = 1 })
require("scope").setup()

-- Custom Plugins Configs
require("user.plug.gitsigns")
require("user.plug.autopairs")
require("user.plug.nvim-tree")
require("user.plug.lualine")
require("user.plug.treesitter")
require("user.plug.telescope")
require("user.plug.tabout")
require("user.plug.blankline")
require("user.plug.neozoom")
require("user.plug.trouble")
require("user.plug.copilot")
require("user.plug.nvim-dap")
require("user.plug.symbols_outline")
require("user.plug.colorizer")
require("user.plug.navic")
require("user.plug.winbar")
require("user.plug.colortils")
require("user.plug.auto-session")
require("user.plug.zen-mode")
require("user.plug.vimwiki")
require("user.plug.spectre")
require("user.plug.todo")
-- require("user.plug.bufferline")
-- require("user.plug.aerial")
-- require("user.plug.noice")
-- require("user.plug.harpoon")
-- require("user.plug.alpha")
-- require("user.plug.mdeval")
-- require("user.plug.hop")
-- require("user.plug.illuminate")
-- require("user.plug.neorg")
-- require("user.plug.tabnine")
-- require('user.plug.toggleterm')
