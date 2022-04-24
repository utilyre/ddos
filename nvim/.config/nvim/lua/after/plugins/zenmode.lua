local zenmode = require("zen-mode")
zenmode.setup({
  window = {
    backdrop = 1,
  },
})

vim.keymap.set("n", "<leader>z", zenmode.toggle)
