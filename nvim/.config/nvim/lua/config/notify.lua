local notify = require("notify")

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
