require('neorg').setup {
  load = {
    ["core.defaults"] = {},
    ["core.norg.completion"] = {
      config = {
        engine = "nvim-cmp"
      }
    },
    ["core.norg.concealer"] = {},
    ["core.norg.dirman"] = {
      config = {
        workspaces = {
          work = "~/tasks/",
        },
        default_workspace = "work",
        open_last_workspace = false
      }
    },
    ["core.gtd.base"] = {
      config = {
        workspace = "work",
      }
    },
    ["core.integrations.nvim-cmp"] = {},
  }
}
