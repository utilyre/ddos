vim.g.catppuccin_flavour = "mocha"

local devicons = require("nvim-web-devicons")
local catppuccin = require("catppuccin")
local palette = require("catppuccin.palettes").get_palette()

devicons.setup({
  default = true,
})

catppuccin.setup({
  integrations = {
    navic = {
      enabled = true,
      custom_bg = "none",
    },
  },
})
catppuccin.load()

vim.api.nvim_set_hl(0, "BufferMod", { bg = "none", fg = palette.peach })
vim.api.nvim_set_hl(0, "FidgetTitle", { bold = true, bg = "none", fg = palette.yellow })
vim.api.nvim_set_hl(0, "FidgetTask", { bg = "none", fg = palette.subtext0 })
vim.api.nvim_set_hl(0, "StatusLine", { bg = "none", fg = palette.text })
