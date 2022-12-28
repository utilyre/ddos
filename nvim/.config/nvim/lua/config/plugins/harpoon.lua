local spec = {
  "theprimeagen/harpoon",
  dependencies = {
    "nvim-lua/plenary.nvim",
  },
}

function spec.config()
  local harpoon = require("harpoon")
  local mark = require("harpoon.mark")
  local ui = require("harpoon.ui")

  harpoon.setup()

  vim.keymap.set("n", "m", vim.callback(mark.add_file))
  vim.keymap.set("n", "<s-tab>", vim.callback(ui.nav_prev))
  vim.keymap.set("n", "<tab>", vim.callback(ui.nav_next))
end

return spec
