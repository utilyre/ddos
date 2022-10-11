local noice = require("noice")

noice.setup({
  messages = {
    enabled = true,
  },
  cmdline = {
    enabled = true,
    icons = {
      [":"] = {
        firstc = false,
        icon = ":",
      },
      ["/"] = {
        firstc = false,
        icon = "/",
      },
      ["?"] = {
        firstc = false,
        icon = "?",
      },
    },
  },
  popupmenu = {
    enabled = true,
    backend = "cmp",
  },
  views = {
    cmdline_popup = {
      position = {
        row = "1",
        col = "50%",
      },
      border = {
        style = "rounded",
        text = {
          top = " Palette ",
        },
      },
      win_options = {
        winhighlight = {
          Normal = "NoiceNormal",
          FloatBorder = "NoiceBorder",
        },
      },
    },
  },
})
