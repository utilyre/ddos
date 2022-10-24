local tokyonight = require("tokyonight")

tokyonight.setup({
  style = "night",
  on_colors = function(colors)
    colors.bg_statusline = "none"
  end,
  on_highlights = function(highlights, colors)
    highlights.NoiceNormal = { background = colors.bg_float, foreground = colors.fg }
    highlights.NoiceBorder = { bold = true, background = colors.bg_float, foreground = colors.border_highlight }

    highlights.TelescopeBorder = highlights.NoiceBorder
    highlights.TelescopePromptPrefix = { foreground = colors.yellow }
    highlights.TelescopeSelectionCaret = { background = colors.bg_visual, foreground = colors.teal }
    highlights.TelescopeMultiIcon = { foreground = colors.red }
    highlights.TelescopeMultiSelection = { bold = true, italic = true }
  end,
})
tokyonight.colorscheme()
