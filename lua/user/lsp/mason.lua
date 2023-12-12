local status_ok, mason = pcall(require, "mason")
if not status_ok then
  return
end

local status_ok_1, mason_lspconfig = pcall(require, "mason-lspconfig")
if not status_ok_1 then
  return
end

local servers = {
  "cssls",
  "cssmodules_ls",
  "emmet_ls",
  "html",
  "jsonls",
  "solidity",
  "lua_ls",
  "tsserver",
  "texlab",
  "eslint",
  "bashls",
  "clangd",
  "sourcery",
  "eslint",
  "rust_analyzer",
  "pyright",
  "jdtls",
}

local settings = {
  ui = {
    border = "rounded",
    icons = {
      package_installed = "◍",
      package_pending = "◍",
      package_uninstalled = "◍",
    },
  },
  log_level = vim.log.levels.INFO,
  max_concurrent_installers = 4,
}

mason.setup(settings)
mason_lspconfig.setup {
  ensure_installed = servers,
  automatic_installation = true,
}

local lspconfig_status_ok, lspconfig = pcall(require, "lspconfig")
if not lspconfig_status_ok then
  return
end

local opts = {}

-- NOTE: These are custom handlers that I use for LSPs
for _, server in pairs(servers) do
  opts = {
    on_attach = require("user.lsp.handlers").on_attach,
    capabilities = require("user.lsp.handlers").capabilities,
  }

  server = vim.split(server, "@")[1]

  -- FIXME: Get this working
  if server.name == "pylsp" then
    local bashls_opts = {
      settings = {
        pylsp = {
          plugins = {
            pydocstyle = {
              enabled = false,
            },
            pyflakes = {
              enabled = false,
            },
            pylint = {
              enabled = false,
            }
          }
        }
      }
    }
    opts = vim.tbl_deep_extend("force", bashls_opts, opts)
  end

  lspconfig[server].setup(opts)
  ::continue::
end
