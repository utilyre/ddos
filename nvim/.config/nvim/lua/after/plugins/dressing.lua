local dressing = require("dressing")
local themes = require("telescope.themes")

dressing.setup({
  input = {
    enabled = true,
    relative = "editor",
    border = "single",
    winblend = 0,
    insert_only = false,
  },
  select = {
    enabled = true,
    telescope = themes.get_dropdown(),
  },
})
