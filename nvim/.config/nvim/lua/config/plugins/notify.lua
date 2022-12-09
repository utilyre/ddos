local notify = require("notify")

notify.setup({
  stages = "slide",
  top_down = false,
  icons = {
    INFO = vim.g.icons.diagnostic.Information,
    WARN = vim.g.icons.diagnostic.Warning,
    ERROR = vim.g.icons.diagnostic.Error,
  },
})
