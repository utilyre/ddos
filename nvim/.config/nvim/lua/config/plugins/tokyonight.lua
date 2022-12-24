local spec = {
  "folke/tokyonight.nvim",
}

function spec.init()
  local tokyonight = require("tokyonight")

  tokyonight.load()
end

function spec.config()
  local tokyonight = require("tokyonight")

  tokyonight.setup({
    style = "night",
    on_colors = function(colors)
      colors.bg_statusline = "none"
    end,
    on_highlights = function(highlights, colors)
      highlights.TelescopePromptPrefix = { foreground = colors.blue }
      highlights.TelescopeSelectionCaret = { background = colors.bg_visual, foreground = colors.teal }
      highlights.TelescopeMultiIcon = { foreground = colors.red }
      highlights.TelescopeMultiSelection = { bold = true, italic = true }

      highlights.BarbecueNormal = { foreground = colors.fg_dark }
      highlights.BarbecueDirname = { foreground = colors.fg_dark }
      highlights.BarbecueBasename = { foreground = colors.fg_dark }
      highlights.BarbecueContext = { foreground = colors.fg_dark }
    end,
  })
end

return spec
