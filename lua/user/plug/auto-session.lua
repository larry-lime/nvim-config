local status_ok, autosession = pcall(require, "auto-session")
if not status_ok then
  return
end

local function close_neo_tree()
  local bufs = vim.api.nvim_list_bufs()
  for _, buf in ipairs(bufs) do
    if vim.api.nvim_buf_get_option(buf, "filetype") == "neo-tree" then
      vim.api.nvim_buf_delete(buf, { force = true })
    end
  end
end

autosession.setup {
  log_level = "error",
  auto_restore_enabled = true,
  auto_session_use_git_branch = true,
  cwd_change_handling = {
    restore_upcoming_session = true,   -- already the default, no need to specify like this, only here as an example
    pre_cwd_changed_hook = nil,        -- already the default, no need to specify like this, only here as an example
    post_cwd_changed_hook = function() -- example refreshing the lualine status line _after_ the cwd changes
      require("lualine").refresh()     -- refresh lualine so the new session name is displayed in the status bar
    end,
  },
  post_restore_cmds = { close_neo_tree }
}

local opts = { noremap = true, silent = true }
local keymap = vim.api.nvim_set_keymap

keymap("n", "<leader>sl", ":RestoreSession<CR>", opts)
