local spec = {
  "utilyre/barbecue.nvim",
  dependencies = {
    "smiteshp/nvim-navic",
    "nvim-tree/nvim-web-devicons",
  },
}

function spec.config()
  local barbecue = require("barbecue")

  barbecue.setup({
    show_modified = true,
    kinds = vim.g.icons.kind,
  })
end

return spec
