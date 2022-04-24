local lualine = require("lualine")
lualine.setup({
  options = {
    section_separators = { left = "", right = "" },
    component_separators = { left = "", right = "" },
    globalstatus = true,
  },
  sections = {
    lualine_b = {
      { "branch" },
      { "diff" },
      { "diagnostics", symbols = { error = " ", warn = " ", hint = " ", info = " " } },
    },
  },
})
