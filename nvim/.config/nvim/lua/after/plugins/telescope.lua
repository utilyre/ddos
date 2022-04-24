local telescope = require("telescope")
local builtin = require("telescope.builtin")

telescope.setup({
  pickers = {
    find_files = { theme = "dropdown" },
    oldfiles = { theme = "dropdown" },
    live_grep = { theme = "dropdown" },
  },
})

vim.keymap.set("n", "<leader>ff", builtin.find_files)
vim.keymap.set("n", "<leader>fr", builtin.oldfiles)
vim.keymap.set("n", "<leader>fw", builtin.live_grep)
