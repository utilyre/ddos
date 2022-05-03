local dressing = require("dressing")
local themes = require("telescope.themes")

dressing.setup({
  input = {
    enabled = true,
    insert_only = false,
  },
  select = {
    enabled = true,
    telescope = themes.get_cursor(),
  },
})
