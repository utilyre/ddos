local reach = require("reach")

reach.setup({
  notifications = false,
})

vim.keymap.set("n", "<tab>", vim.hof(reach.buffers, { handle = "dynamic", show_current = true, }))
