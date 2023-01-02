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
    kinds = vim.g.icons.kind,
    symbols = {
      ellipsis = vim.g.icons.layout.Ellipsis,
      separator = vim.g.icons.layout.Chevron,
    }
  })
end

return spec
