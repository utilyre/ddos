local noice = require("noice")

noice.setup({
  presets = {
    command_palette = true,
    long_message_to_split = true,
  },
  messages = {
    enabled = true,
  },
  cmdline = {
    enabled = true,
    format = {
      filter = false,
      help = false,
      lua = false,
      cmdline = {
        icon = ":",
      },
      search_down = {
        icon = "/",
      },
      search_up = {
        icon = "?",
      },
    },
  },
  popupmenu = {
    enabled = true,
    backend = "cmp",
  },
})
