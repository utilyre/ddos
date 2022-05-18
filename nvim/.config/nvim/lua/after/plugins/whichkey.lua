local whichkey = require("which-key")

whichkey.setup({
  ignore_missing = true,
  window = {
    border = "single",
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

whichkey.register({
  u = { "<cmd>nohlsearch<cr>", "Unselect" }
}, { prefix = "<leader>" })
