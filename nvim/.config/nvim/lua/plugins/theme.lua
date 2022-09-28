vim.g.catppuccin_flavour = "mocha"

local devicons = require("nvim-web-devicons")
local catppuccin = require("catppuccin")
local palette = require("catppuccin.palettes").get_palette(vim.g.flavor)

devicons.setup({
  default = true,
})

catppuccin.setup()
catppuccin.load()

vim.api.nvim_set_hl(0, "BufferMod", { bg = palette.none, fg = palette.peach })
