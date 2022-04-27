local whichkey = require("which-key")

whichkey.setup({
  ignore_missing = false,
  window = {
    border = "single",
  },
  icons = {
    breadcrumb = "=>",
    separator = ":",
    group = "~",
  },
})
