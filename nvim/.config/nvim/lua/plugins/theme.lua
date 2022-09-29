vim.g.catppuccin_flavour = "mocha"

local devicons = require("nvim-web-devicons")
local catppuccin = require("catppuccin")
local palette = require("catppuccin.palettes").get_palette()

devicons.setup({
  default = true,
})

catppuccin.setup()
catppuccin.load()

vim.api.nvim_set_hl(0, "BufferMod", { bg = palette.none, fg = palette.peach })
vim.api.nvim_set_hl(0, "FidgetTitle", { bold = true, bg = palette.none, fg = palette.yellow })
vim.api.nvim_set_hl(0, "FidgetTask", { bg = palette.none, fg = palette.subtext0 })
vim.api.nvim_set_hl(0, "StatusLine", { bg = palette.none, fg = palette.text })
