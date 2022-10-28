local noice = require("noice")

noice.setup({
  presets = {
    command_palette = true,
    long_message_to_split = true,
  },
  cmdline = {
    enabled = true,
    format = {
      filter = false,
      help = false,
      lua = false,
      cmdline = {
        title = " Palette ",
        icon = ":",
      },
      search_down = {
        title = " Look Up ",
        icon = "/",
      },
      search_up = {
        title = " Look Up ",
        icon = "?",
      },
    },
  },
  popupmenu = {
    enabled = true,
    backend = "cmp",
  },
})
