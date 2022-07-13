local notify = require("notify")

vim.notify = notify

notify.setup({
  stages = "slide",
  background_colour = "NormalFloat",
  icons = {
    ERROR = vim.g.symbols.diagnostic.Error,
    WARN = vim.g.symbols.diagnostic.Warn,
    INFO = vim.g.symbols.diagnostic.Info,
  },
})
