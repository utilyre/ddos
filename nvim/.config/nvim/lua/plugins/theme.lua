local devicons = require("nvim-web-devicons")
local tokyonight = require("tokyonight")

devicons.setup({
  default = true,
})

tokyonight.setup({
  on_colors = function(colors)
    colors.bg_statusline = "none"
  end,
})

tokyonight.colorscheme()
