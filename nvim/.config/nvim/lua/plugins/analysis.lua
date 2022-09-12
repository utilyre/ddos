local treesitter = require("nvim-treesitter.configs")
local twilight = require("twilight")

treesitter.setup({
  ensure_installed = "all",
  highlight = {
    enable = true,
  },
  rainbow = {
    enable = true,
  },
  indent = {
    enable = true,
  },
  autotag = {
    enable = true,
  },
})

twilight.setup({
  dimming = {
    alpha = 1,
    color = { "Comment" },
  },
})

vim.keymap.set("n", "<leader>z", vim.get_hof(twilight.toggle))
