local M = {}

M.setup = function()
  local signs = {
    { name = "DiagnosticSignError", text = "" },
    { name = "DiagnosticSignWarn", text = "" },
    { name = "DiagnosticSignHint", text = "" },
    { name = "DiagnosticSignInfo", text = "" },
  }

  for _, sign in ipairs(signs) do
    vim.fn.sign_define(sign.name, { texthl = sign.name, text = sign.text, numhl = "" })
  end

  local config = {
    virtual_text = false,
    signs = {
      active = signs,
    },
    update_in_insert = true,
    underline = true,
    severity_sort = true,
    float = {
      focusable = false,
      style = "minimal",
      border = "rounded",
      source = "always",
      header = "",
      prefix = "",
    },
  }

  vim.diagnostic.config(config)

  vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
    border = "rounded",
  })

  vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, {
    border = "rounded",
  })
end

local function attach_navic(client, bufnr)
  vim.g.navic_silence = true
  local status_ok, navic = pcall(require, "nvim-navic")
  if not status_ok then
    return
  end
  navic.attach(client, bufnr)
end

local function lsp_commands()
  local command = vim.cmd
  -- command [[ command! Format execute 'lua vim.lsp.buf.format {async = true}' ]]
  command [[ command! LspServerConfig execute 'vert h lspconfig-server-configurations' ]]
end

local function lsp_keymaps(bufnr)
  local buffer_keymap = vim.api.nvim_buf_set_keymap
  local opts = { noremap = true, silent = true }
  buffer_keymap(bufnr, "n", "gD", "<cmd>Telescope lsp_declarations<CR>", opts)
  buffer_keymap(bufnr, "n", "gd", "<cmd>Telescope lsp_definitions<CR>", opts)
  buffer_keymap(bufnr, "n", "gI", "<cmd>Telescope lsp_implementations<CR>", opts)
  buffer_keymap(bufnr, "n", "gl", "<cmd>lua vim.diagnostic.open_float()<CR>", opts)
  buffer_keymap(bufnr, "n", "gr", "<cmd>Telescope lsp_references<CR>", opts)
  buffer_keymap(bufnr, "n", "<leader>ra", "<cmd>lua vim.lsp.buf.rename()<CR>", opts)
  buffer_keymap(bufnr, "n", "<leader>ca", "<cmd>lua vim.lsp.buf.code_action({apply=true})<CR>", opts)
  buffer_keymap(bufnr, "n", "[d", '<cmd>lua vim.diagnostic.goto_prev({ border = "rounded" })<CR>', opts)
  buffer_keymap(bufnr, "n", "]d", '<cmd>lua vim.diagnostic.goto_next({ border = "rounded" })<CR>', opts)
end

M.on_attach = function(client, bufnr)
  lsp_commands()
  lsp_keymaps(bufnr)
  attach_navic(client, bufnr)
end

local status_ok, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
if not status_ok then
  return
end

M.capabilities = cmp_nvim_lsp.default_capabilities()

return M
