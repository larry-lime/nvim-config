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
  "sqlls",
  "solidity",
  "lua_ls",
  "tsserver",
  "pyright",
  "yamlls",
  "texlab",
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
  if server.name == "pyright" then
    local pyright_opts = require("user.lsp.settings.pyright")
    opts = vim.tbl_deep_extend("force", pyright_opts, opts)
  end

  if server.name == "sourcery" then
    local sourcery_opts = require("user.lsp.settings.sourcery")
    opts = vim.tbl_deep_extend("force", sourcery_opts, opts)
  end

  -- Shell
  if server.name == "bashls" then
    local bashls_opts = require("user.lsp.settings.bashls")
    opts = vim.tbl_deep_extend("force", bashls_opts, opts)
  end

  -- Lua
  if server.name == "lua_ls" then
    local sumneko_lua_opts = require("user.lsp.settings.lua_ls")
    opts = vim.tbl_deep_extend("force", sumneko_lua_opts, opts)
  end

  -- Typescript & Javascript

  if server.name == "tsserver" then
    local tsserver_opts = require("user.lsp.settings.tsserver")
    opts = vim.tbl_deep_extend("force", tsserver_opts, opts)
  end

  if server.name == "eslint" then
    local eslint_opts = require("user.lsp.settings.eslint")
    opts = vim.tbl_deep_extend("force", eslint_opts, opts)
  end

  -- Solidity
  if server.name == "solc" then
    local solc_opts = require("user.lsp.settings.solc")
    opts = vim.tbl_deep_extend("force", solc_opts, opts)
  end

  if server.name == "sqlls" then
    local sqls_opts = require("user.lsp.settings.sqlls")
    opts = vim.tbl_deep_extend("force", sqls_opts, opts)
  end

  if server.name == "solidity-ls" then
    local solidity_ls_opts = require("user.lsp.settings.solidity_ls")
    opts = vim.tbl_deep_extend("force", solidity_ls_opts, opts)
  end

  if server.name == "solang" then
    local solang_opts = require("user.lsp.settings.solang")
    opts = vim.tbl_deep_extend("force", solang_opts, opts)
  end

  -- Rust
  if server.name == "rust_analyzer" then
    local rust_analyzer_opts = require("user.lsp.settings.rust_analyzer")
    opts = vim.tbl_deep_extend("force", rust_analyzer_opts, opts)
  end

  -- HTML/CSS
  if server.name == "html" then
    local html_opts = require("user.lsp.settings.html")
    opts = vim.tbl_deep_extend("force", html_opts, opts)
  end


  if server.name == "cssls" then
    local cssls_opts = require("user.lsp.settings.cssls")
    opts = vim.tbl_deep_extend("force", cssls_opts, opts)
  end

  -- Latex
  if server.name == "texlab" then
    local tex_opts = require("user.lsp.settings.texlab")
    opts = vim.tbl_deep_extend("force", tex_opts, opts)
  end

  -- Golang
  if server.name == "gopls" then
    local gopls_opts = require("user.lsp.settings.gopls")
    opts = vim.tbl_deep_extend("force", gopls_opts, opts)
  end


  lspconfig[server].setup(opts)
  ::continue::
end
