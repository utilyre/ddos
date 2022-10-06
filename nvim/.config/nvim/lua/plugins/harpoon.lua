local harpoon = require("harpoon")
local ui = require("harpoon.ui")
local mark = require("harpoon.mark")

harpoon.setup({
  save_on_toggle = true,
  save_on_change = false,
})

vim.keymap.set("n", "<tab>", vim.fun_lambda(ui.toggle_quick_menu))
vim.keymap.set("n", "<c-m>", vim.fun_lambda(mark.add_file))
