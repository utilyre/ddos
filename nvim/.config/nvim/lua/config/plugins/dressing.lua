local dressing = require("dressing")
local themes = require("telescope.themes")

dressing.setup({
  input = {
    enabled = true,
    border = "rounded",
    winblend = 0,
    insert_only = false,
  },
  select = {
    enabled = true,
    backend = { "telescope" },
    telescope = themes.get_dropdown(),
  },
})
