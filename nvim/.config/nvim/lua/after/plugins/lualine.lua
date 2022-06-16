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
          error = vim.g.symbols.diagnostic.Error .. " ",
          warn = vim.g.symbols.diagnostic.Warn .. " ",
          hint = vim.g.symbols.diagnostic.Hint .. " ",
          info = vim.g.symbols.diagnostic.Info .. " ",
        } },
    },
    lualine_c = {},
  },
})
