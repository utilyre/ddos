local whichkey = require("which-key")

whichkey.setup({
  ignore_missing = true,
  window = {
    border = "single",
  },
  icons = {
    breadcrumb = "=>",
    separator = ":",
    group = "~",
  },
})
