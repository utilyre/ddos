local reach = require("reach")

reach.setup({
  notifications = false,
})

vim.keymap.set("n", "<tab>", vim.fun_create_hof(reach.buffers, { handle = "dynamic", show_current = true, }))
