local treesitter = require("nvim-treesitter.configs")

treesitter.setup({
  ensure_installed = "all",
  ignore_install = { "fusion", "jsonc" },
  highlight = { enable = true },
  indent = { enable = true },
  rainbow = { enable = true },
  autotag = { enable = true },
  context_commentstring = { enable = true },
})
