local configs = require("nvim-treesitter.configs")
local comment = require("Comment")

configs.setup({
  ensure_installed = "all",
  highlight = { enable = true },
  indent = { enable = true },
  rainbow = { enable = true },
  autotag = { enable = true },
})

comment.setup({
  mappings = {
    basic = true,
    extra = true,
    extended = true,
  },
})
