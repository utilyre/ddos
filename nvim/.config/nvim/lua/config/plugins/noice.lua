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
      format = {
        {
          "{progress}",
          key = "progress.percentage",
          contents = {
            "{data.progress.message}",
          },
        },
        " ",
        {
          "{spinner}",
          hl_group = "NoiceLspProgressSpinner",
        },
        " ",
        {
          "{data.progress.client}",
          hl_group = "NoiceLspProgressClient",
        },
        " ",
        {
          "{data.progress.title}",
          hl_group = "NoiceLspProgressTitle",
        },
      },
      format_done = {
        {
          vim.g.icons.package.Ready,
          hl_group = "NoiceLspProgressSpinner",
        },
        " ",
        {
          "{data.progress.client}",
          hl_group = "NoiceLspProgressClient",
        },
        " ",
        {
          "{data.progress.title}",
          hl_group = "NoiceLspProgressTitle",
        },
      },
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
