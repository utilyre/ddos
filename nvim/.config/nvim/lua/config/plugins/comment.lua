local spec = {
  "numtostr/comment.nvim",
  dependencies = {
    "nvim-treesitter/nvim-treesitter",
  },
}

function spec.config()
  local comment = require("Comment")

  comment.setup()
end

return spec
