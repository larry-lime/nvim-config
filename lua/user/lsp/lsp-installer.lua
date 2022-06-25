local status_ok, lsp_installer = pcall(require, "nvim-lsp-installer")
if not status_ok then
  return
end

-- Register a handler that will be called for all installed servers.
-- Alternatively, you may also register handlers on specific server instances instead (see example below).
lsp_installer.on_server_ready(function(server)
  local opts = {
    on_attach = require("user.lsp.handlers").on_attach,
    capabilities = require("user.lsp.handlers").capabilities,
  }

  if server.name == "pyright" then
    local pyright_opts = require("user.lsp.settings.pyright")
    opts = vim.tbl_deep_extend("force", pyright_opts, opts)
  end

  if server.name == "sumneko_lua" then
    local sumneko_lua_opts = require("user.lsp.settings.sumneko_lua")
    opts = vim.tbl_deep_extend("force", sumneko_lua_opts, opts)
  end


  if server.name == "html" then
    local html_opts = require("user.lsp.settings.html")
    opts = vim.tbl_deep_extend("force", html_opts, opts)
  end

  if server.name == "sourcery" then
    local sourcery_opts = require("user.lsp.settings.sourcery")
    opts = vim.tbl_deep_extend("force", sourcery_opts, opts)
  end

  if server.name == "bashls" then
    local bashls_opts = require("user.lsp.settings.bashls")
    opts = vim.tbl_deep_extend("force", bashls_opts, opts)
  end

  if server.name == "cssls" then
    local cssls_opts = require("user.lsp.settings.cssls")
    opts = vim.tbl_deep_extend("force", cssls_opts, opts)
  end

  if server.name == "tailwindcss" then
    local tailwindcss_opts = require("user.lsp.settings.tailwindcss")
    opts = vim.tbl_deep_extend("force", tailwindcss_opts, opts)
  end

  if server.name == "zk" then
    local zk_opts = require("user.lsp.settings.zk")
    opts = vim.tbl_deep_extend("force", zk_opts, opts)
  end

  -- This setup() function is exactly the same as lspconfig's setup function.
  -- Refer to https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md
  server:setup(opts)
end)
