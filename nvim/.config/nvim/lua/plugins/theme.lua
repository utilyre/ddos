local devicons = require("nvim-web-devicons")
local catppuccin = require("catppuccin")

devicons.setup({
  default = true,
})

vim.g.catppuccin_flavour = "mocha"
catppuccin.setup()
catppuccin.load()
