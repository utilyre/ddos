local whichkey = require("which-key")

whichkey.setup({
  ignore_missing = true,
  window = {
    border = "single",
    winblend = 10,
  },
  layout = {
    align = "center",
  },
  icons = {
    breadcrumb = "=>",
    separator = ":",
    group = "~",
  },
})
