local spec = {
  "folke/tokyonight.nvim",
  priority = 100,
}

function spec.config()
  local tokyonight = require("tokyonight")

  tokyonight.setup({
    style = "night",
    on_colors = function(colors) colors.bg_statusline = colors.none end,
    on_highlights = function(highlights, colors)
      highlights.TelescopeSelectionCaret =
        { background = colors.bg_visual, foreground = colors.teal }
      highlights.TelescopeMultiIcon = { foreground = colors.green }
      highlights.TelescopeMultiSelection = { bold = true }
    end,
  })

  tokyonight.load()
end

return spec
