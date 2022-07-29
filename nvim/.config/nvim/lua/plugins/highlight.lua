local treesitter = require("nvim-treesitter.configs")
local indentblankline = require("indent_blankline")

treesitter.setup({
  ensure_installed = "all",
  highlight = { enable = true },
  rainbow = { enable = true },
  indent = { enable = true },
  autotag = { enable = true },
})

indentblankline.setup({
  show_current_context = true,
  show_trailing_blankline_indent = false,
})
