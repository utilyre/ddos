local telescope = require("telescope")
local builtin = require("telescope.builtin")
local whichkey = require("which-key")

telescope.setup({
  pickers = {
    find_files = { theme = "dropdown" },
    oldfiles = { theme = "dropdown" },
    live_grep = { theme = "dropdown" },
  },
})

whichkey.register({
  f = {
    name = "Find",
    f = { builtin.find_files, "File" },
    r = { builtin.oldfiles, "Recent" },
    w = { builtin.live_grep, "Word" },
  },
}, { prefix = "<leader>" })
