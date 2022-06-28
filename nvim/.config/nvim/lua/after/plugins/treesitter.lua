local configs = require("nvim-treesitter.configs")
local indentblankline = require("indent_blankline")
local comment = require("Comment")

configs.setup({
  ensure_installed = "all",
  highlight = { enable = true },
  indent = { enable = true },
  rainbow = { enable = true },
})

indentblankline.setup({
  show_current_context = true,
})

comment.setup({
  mappings = {
    basic = true,
    extra = true,
    extended = true,
  },
})
