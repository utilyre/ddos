local treesitter = require("nvim-treesitter.configs")

treesitter.setup({
  ensure_installed = "all",
  highlight = { enable = true },
  indent = { enable = true },
  rainbow = { enable = true },
  autotag = { enable = true },
  context_commentstring = { enable = true },
})
