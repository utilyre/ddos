local dressing = require("dressing")

dressing.setup({
  input = {
    enabled = true,
    relative = "editor",
    border = "rounded",
    winblend = 0,
    insert_only = false,
  },
  select = {
    enabled = true,
    backend = { "builtin" },
    builtin = {
      winblend = 0,
      mappings = {
        ["q"] = "Close",
        ["<cr>"] = "Confirm",
      },
    },
  },
})
