local whichkey = require("which-key")

whichkey.setup({
  ignore_missing = true,
  window = {
    border = "rounded",
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
