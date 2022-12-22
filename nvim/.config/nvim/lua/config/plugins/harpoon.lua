local spec = {
  "theprimeagen/harpoon",
}

function spec.config()
  local harpoon = require("harpoon")
  local ui = require("harpoon.ui")
  local mark = require("harpoon.mark")

  harpoon.setup({
    save_on_toggle = true,
    save_on_change = false,
  })

  vim.keymap.set("n", "<tab>", vim.callback(ui.toggle_quick_menu))
  vim.keymap.set("n", "<c-1>", vim.callback(ui.nav_file, 1))
  vim.keymap.set("n", "<c-2>", vim.callback(ui.nav_file, 2))
  vim.keymap.set("n", "<c-3>", vim.callback(ui.nav_file, 3))
  vim.keymap.set("n", "<c-4>", vim.callback(ui.nav_file, 4))
  vim.keymap.set("n", "<c-m>", vim.callback(mark.add_file))
end

return spec
