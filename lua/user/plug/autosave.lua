require("auto-save").setup(
  {
    enabled = true,
      events = { "InsertLeave", "TextChanged  "}, -- :help events
      -- execution_message = "AutoSave: saved at " .. vim.fn.strftime("%H:%M:%S"),
      execution_message = "",
      conditions = {
      exists = true,
      filename_is_not = {},
      filetype_is_not = {},
      modifiable = true
    },
    write_all_buffers = false,
    on_off_commands = true,
    clean_command_line_interval = 0,
    debounce_delay = 135,
    -- debounce_delay = 1000
  }
)
