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
  "pyright",
  "eslint",
  "bashls",
  "clangd",
  "rust_analyzer",
  -- "sourcery"
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

for _, server in pairs(servers) do
  opts = {
    on_attach = require("user.lsp.handlers").on_attach,
    capabilities = require("user.lsp.handlers").capabilities,
  }

  server = vim.split(server, "@")[1]

  -- Python
  -- if server.name == "pyright" then
  --   local pyright_opts = {}
  --   opts = vim.tbl_deep_extend("force", pyright_opts, opts)
  -- end

  if server.name == "sourcery" then
    local sourcery_opts = {
      init_options = {
        --- The Sourcery token for authenticating the user.
        --- This is retrieved from the Sourcery website and must be
        --- provided by each user. The extension must provide a
        --- configuration option for the user to provide this value.
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

  -- Shell
  if server.name == "bashls" then
    local bashls_opts = { filetypes = { "zsh", "sh" },
    }
    opts = vim.tbl_deep_extend("force", bashls_opts, opts)
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

  -- Rust
  if server.name == "rust_analyzer" then
    local rust_analyzer_opts = {}
    opts = vim.tbl_deep_extend("force", rust_analyzer_opts, opts)
  end

  -- -- Solidity
  if server.name == "solidity" then
    local solidity_opts = require("user.lsp.settings.solidity")
    opts = vim.tbl_deep_extend("force", solidity_opts, opts)
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


  if server.name == "cssls" then
    local cssls_opts = {}
    opts = vim.tbl_deep_extend("force", cssls_opts, opts)
  end

  -- Latex
  if server.name == "texlab" then
    local tex_opts = {}
    opts = vim.tbl_deep_extend("force", tex_opts, opts)
  end

  -- Golang
  if server.name == "gopls" then
    local gopls_opts = {}
    opts = vim.tbl_deep_extend("force", gopls_opts, opts)
  end


  lspconfig[server].setup(opts)
  ::continue::
end
