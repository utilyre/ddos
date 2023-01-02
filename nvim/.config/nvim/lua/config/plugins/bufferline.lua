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
      left_trunc_marker = vim.g.icons.layout.Ellipsis,
      right_trunc_marker = vim.g.icons.layout.Ellipsis,
    },
  })

  vim.keymap.set("n", "<s-h>", vim.callback(bufferline.cycle, -1))
  vim.keymap.set("n", "<s-l>", vim.callback(bufferline.cycle, 1))
end

return spec
