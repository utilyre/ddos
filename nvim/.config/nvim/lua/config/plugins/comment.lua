local spec = {
  "numtostr/comment.nvim",
}

function spec.config()
  local comment = require("Comment")

  comment.setup()
end

return spec
