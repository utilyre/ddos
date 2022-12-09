local noice = require("noice")
local lsp = require("noice.lsp")

noice.setup({
  presets = {
    command_palette = true,
    lsp_doc_border = true,
  },
  messages = {
    view_history = "popup",
    view_search = false,
  },
  cmdline = {
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
  lsp = {
    progress = {
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
      position = {
        row = 2,
        col = -2,
      },
    },
  },
})

vim.keymap.set("n", "<c-y>", function()
  if lsp.scroll(-1) then return end
  return "<c-y>"
end, { expr = true })
vim.keymap.set("n", "<c-e>", function()
  if lsp.scroll(1) then return end
  return "<c-e>"
end, { expr = true })
