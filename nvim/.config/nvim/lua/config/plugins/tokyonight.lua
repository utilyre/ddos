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

      highlights.TodoCommentsNote = { foreground = colors.teal }
      highlights.TodoCommentsTodo = { foreground = colors.blue2 }
      highlights.TodoCommentsWarn = { foreground = colors.yellow }
      highlights.TodoCommentsBug = { foreground = colors.red }
      highlights.TodoCommentsTest = { foreground = colors.cyan }
      highlights.TodoCommentsPerf = { foreground = colors.magenta }
    end,
  })

  tokyonight.load()
end

return spec
