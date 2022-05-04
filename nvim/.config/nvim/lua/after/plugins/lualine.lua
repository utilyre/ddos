local lualine = require("lualine")

lualine.setup({
  options = {
    globalstatus = true,
    section_separators = { left = "", right = "" },
    component_separators = { left = "", right = "" },
  },
  sections = {
    lualine_b = {
      { "branch" },
      { "diff" },
      { "diagnostics",
        update_in_insert = true,
        symbols = {
          error = " ",
          warn = " ",
          hint = " ",
          info = " ",
        } },
    },
  },
})
