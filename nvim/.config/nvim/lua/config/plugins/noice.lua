local noice = require("noice")

noice.setup({
  presets = {
    command_palette = true,
    lsp_doc_border = true,
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
      calculator = {
        pattern = "^=",
        title = " Pad ",
        icon = "=",
      },
    },
  },
  popupmenu = {
    enabled = true,
    backend = "cmp",
  },
  lsp = {
    hover = {
      enabled = true,
    },
    signature = {
      enabled = true,
    },
    progress = {
      enabled = true,
    },
  },
  views = {
    mini = {
      zindex = 40,
    },
  },
  routes = {
    {
      filter = {
        event = "msg_show",
        kind = "",
      },
      opts = {
        skip = true,
      },
    },
  },
})
