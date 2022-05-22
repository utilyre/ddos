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
  q = { "<cmd>quitall<cr>", "Quit" },
  w = { "<cmd>write<cr>", "Write" },
  u = { "<cmd>nohlsearch<cr>", "Unselect" }
}, { prefix = "<leader>" })
