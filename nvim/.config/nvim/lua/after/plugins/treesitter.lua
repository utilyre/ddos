local configs = require("nvim-treesitter.configs")
local comment = require("Comment")
local indentblankline = require("indent_blankline")

configs.setup({
  ensure_installed = "all",
  highlight = { enable = true },
  indent = { enable = true },
  rainbow = { enable = true },
})

comment.setup({
  mappings = {
    basic = true,
    extra = true,
    extended = true,
  },
})

indentblankline.setup({
  show_current_context = true,
})
