local spec = {
  "akinsho/bufferline.nvim",
  dependencies = {
    "nvim-tree/nvim-web-devicons",
  },
}

function spec.config()
  local bufferline = require("bufferline")

  bufferline.setup({
    options = {
      show_close_icon = false,
      show_buffer_close_icons = false,
    },
  })
end

return spec
