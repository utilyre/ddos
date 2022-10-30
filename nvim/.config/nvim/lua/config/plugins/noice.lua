local noice = require("noice")

noice.setup({
  presets = {
    command_palette = true,
    long_message_to_split = true,
  },
  cmdline = {
    enabled = true,
    format = {
      cmdline = {
        title = " Palette ",
        icon = ":",
      },
      search_down = {
        title = " Find ",
        icon = "/",
      },
      search_up = {
        title = " Find ",
        icon = "?",
      },
    },
  },
  popupmenu = {
    enabled = true,
    backend = "cmp",
  },
})
