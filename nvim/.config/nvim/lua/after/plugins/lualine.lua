local lualine = require("lualine")

lualine.setup({
  options = {
    globalstatus = true,
    section_separators = { left = vim.g.symbols.ui.SectionLeft, right = vim.g.symbols.ui.SectionRight },
    component_separators = { left = vim.g.symbols.ui.ComponentLeft, right = vim.g.symbols.ui.ComponentRight },
  },
  sections = {
    lualine_b = {
      { "branch" },
      { "diff" },
      { "diagnostics",
        update_in_insert = true,
        symbols = {
          error = vim.g.symbols.diagnostics.Error .. " ",
          warn = vim.g.symbols.diagnostics.Warn .. " ",
          hint = vim.g.symbols.diagnostics.Hint .. " ",
          info = vim.g.symbols.diagnostics.Info .. " ",
        } },
    },
  },
})
