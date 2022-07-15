local notify = require("notify")
local dressing = require("dressing")
local project = require("project_nvim")

notify.setup({
  stages = "slide",
  background_colour = "NormalFloat",
  icons = {
    ERROR = vim.g.symbols.diagnostic.Error,
    WARN = vim.g.symbols.diagnostic.Warn,
    INFO = vim.g.symbols.diagnostic.Info,
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
  },
})

project.setup({
  manual_mode = true,
})
