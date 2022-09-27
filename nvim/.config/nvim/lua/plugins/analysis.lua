local treesitter = require("nvim-treesitter.configs")
local indentblankline = require("indent_blankline")
local autopairs = require("nvim-autopairs")
local comment = require("Comment")

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

indentblankline.setup({
  show_current_context = true,
  show_trailing_blankline_indent = false,
})

autopairs.setup({
  check_ts = true,
})

comment.setup({
  mappings = {
    basic = true,
    extra = true,
    extended = true,
  },
})
