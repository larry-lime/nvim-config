local status_ok, lsp_installer = pcall(require, "nvim-lsp-installer")
if not status_ok then
  return
end

-- TODO change my setup so that it is much more similar to chris@machine's setup
lsp_installer.on_server_ready(function(server)
  local opts = {
    on_attach = require("user.lsp.handlers").on_attach,
    capabilities = require("user.lsp.handlers").capabilities,
  }

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

  if server.name == "sumneko_lua" then
    local sumneko_lua_opts = require("user.lsp.settings.sumneko_lua")
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

  if server.name == "solidity_ls" then
    local solidity_ls_opts = require("user.lsp.settings.solidity_ls")
    opts = vim.tbl_deep_extend("force", solidity_ls_opts, opts)
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

  -- Markdown

  if server.name == "zk" then
    local zk_opts = require("user.lsp.settings.zk")
    opts = vim.tbl_deep_extend("force", zk_opts, opts)
  end

  -- Golang

  if server.name == "gopls" then
    local gopls_opts = require("user.lsp.settings.gopls")
    opts = vim.tbl_deep_extend("force", gopls_opts, opts)
  end

  -- Unused LSPs

  -- if server.name == "tailwindcss" then
  --   local tailwindcss_opts = require("user.lsp.settings.tailwindcss")
  --   opts = vim.tbl_deep_extend("force", tailwindcss_opts, opts)
  -- end

  -- if server.name == "emmet_ls" then
  --   local emmet_ls_opts = require("user.lsp.settings.emmet_ls")
  --   opts = vim.tbl_deep_extend("force", emmet_ls_opts, opts)
  -- end

  server:setup(opts)
end)
