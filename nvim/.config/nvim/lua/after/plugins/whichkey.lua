local whichkey = require("which-key")

whichkey.setup({
  ignore_missing = true,
  window = {
    border = "single",
    winblend = 10,
  },
  icons = {
    breadcrumb = "=>",
    separator = ":",
    group = "~",
  },
})
