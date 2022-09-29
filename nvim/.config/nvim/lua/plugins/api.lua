local notify = require("notify")
local dressing = require("dressing")

notify.setup({
  stages = "slide",
  top_down = false,
  background_colour = "NormalFloat",
  icons = {
    INFO = _G.icons.diagnostic.Information,
    WARN = _G.icons.diagnostic.Warning,
    ERROR = _G.icons.diagnostic.Error,
  },
})

vim.notify = notify

dressing.setup({
  input = {
    enabled = true,
    relative = "editor",
    border = "rounded",
    winblend = 0,
    insert_only = false,
  },
  select = {
    enabled = true,
    backend = { "builtin" },
    builtin = {
      winblend = 0,
      mappings = {
        q = "Close",
      },
    },
  },
})
