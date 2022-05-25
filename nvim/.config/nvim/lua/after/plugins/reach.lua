local reach = require("reach")

reach.setup({
  notifications = false,
})

vim.keymap.set("n", "<tab>", function()
  reach.buffers({
    handle = "dynamic",
    show_current = true,
    modified_icon = vim.g.symbols.ui.Modified,
  })
end)
