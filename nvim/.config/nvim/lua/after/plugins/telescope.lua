local telescope = require("telescope")
local builtin = require("telescope.builtin")
local whichkey = require("which-key")

telescope.setup({
  pickers = {
    oldfiles = { theme = "dropdown" },
    find_files = { theme = "dropdown" },
    buffers = { theme = "dropdown" },
    live_grep = { theme = "dropdown" },
    builtin = { theme = "dropdown" },
  },
})

whichkey.register({
  f = {
    name = "Find",
    r = { builtin.oldfiles, "Recent" },
    f = { builtin.find_files, "File" },
    b = { builtin.buffers, "Buffer" },
    w = { builtin.live_grep, "Word" },
    o = { builtin.builtin, "Other" },
  },
}, { prefix = "<leader>" })
