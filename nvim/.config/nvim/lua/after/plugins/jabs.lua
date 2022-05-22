local jabs = require("jabs")

jabs.setup({
  position = "center",
  border = "rounded",
})

vim.keymap.set("n", "<tab>", "<cmd>JABSOpen<cr>")
