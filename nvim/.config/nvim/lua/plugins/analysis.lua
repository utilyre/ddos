local treesitter = require("nvim-treesitter.configs")
local context = require("treesitter-context")
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

context.setup({
  max_lines = 1,
})

twilight.setup({
  dimming = {
    alpha = 1,
    color = { "Comment" },
  },
})

vim.keymap.set("n", "<leader>z", vim.get_hof(twilight.toggle))
