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
  "rust_analyzer",
  "pyright",
  -- "pylsp"
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

  if server.name == "sourcery" then
    local sourcery_opts = {
      init_options = {
        cmd = { 'sourcery', 'lsp' },
        filetypes = { 'python' },
        single_file_support = true,
        token = 'user_t3_0QDCtej6yVfc3hdBu9eVkEVY7HcgL6J8IolTUZH_pb4zkavmHqWqOT5Y',
        editor_version = 'vim',
        extension_version = 'vim_lsp',
      }
    }
    opts = vim.tbl_deep_extend("force", sourcery_opts, opts)
  end

  -- Lua
  if server.name == "lua_ls" then
    local sumneko_lua_opts = {
      settings = {
        Lua = {
          diagnostics = {
            globals = { 'vim' }
          }
        }
      }
    }
    opts = vim.tbl_deep_extend("force", sumneko_lua_opts, opts)
  end

  -- Typescript & Javascript
  if server.name == "tsserver" then
    local tsserver_opts = {
      filetypes = {
        "javascript",
        "javascriptreact",
        "javascript.jsx",
        "typescript",
        "typescriptreact",
        "typescript.tsx",
        -- "html"
      }
    }
    opts = vim.tbl_deep_extend("force", tsserver_opts, opts)
  end

  if server.name == "eslint" then
    local eslint_opts = {
      filtypes = {
        "javascript",
        "javascriptreact",
        "javascript.jsx",
        "typescript",
        "typescriptreact",
        "typescript.tsx",
        "vue",
        -- "html"
      }
    }
    opts = vim.tbl_deep_extend("force", eslint_opts, opts)
  end

  -- HTML/CSS
  if server.name == "html" then
    local html_opts = {
      configurationSection = { "html" },
      embeddedLanguages = {
        css = true,
        javascript = true
      },
      provideFormatter = true
    }

    opts = vim.tbl_deep_extend("force", html_opts, opts)
  end

  -- Bash
  if server.name == "bashls" then
    local bashls_opts = {
      filetypes = { "sh", "zsh" },
    }
    opts = vim.tbl_deep_extend("force", bashls_opts, opts)
  end

  -- Bash
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
