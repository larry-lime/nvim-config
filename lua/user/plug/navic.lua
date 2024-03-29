local icons = require("user.icons")
local status_ok, navic = pcall(require, "nvim-navic")
if not status_ok then
  return
end

local icons = require "user.icons"

navic.setup {
  icons = {
    File          = " ",
    Module        = " ",
    Namespace     = " ",
    Package       = " ",
    Class         = " ",
    Method        = "m ",
    Property      = " ",
    Field         = " ",
    Constructor   = " ",
    Enum          = "練",
    Interface     = " ",
    Function      = " ",
    Variable      = " ",
    Constant      = " ",
    String        = " ",
    Number        = " ",
    Boolean       = "◩ ",
    Array         = " ",
    Object        = " ",
    Key           = " ",
    Null          = "ﳠ ",
    EnumMember    = " ",
    Struct        = " ",
    Event         = " ",
    Operator      = " ",
    TypeParameter = " ",
  },
  highlight = true,
  -- separator = "  ",
  separator = "  ",
  depth_limit = 0,
  depth_limit_indicator = "..",
  safe_output = true
}
