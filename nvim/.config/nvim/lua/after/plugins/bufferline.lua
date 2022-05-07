local bufferline = require("bufferline")

bufferline.setup({
  options = {
    right_mouse_command = "Bdelete %d",
    show_close_icon = false,
    show_buffer_close_icons = false,
    offsets = { {
      text = "Explorer",
      filetype = "NvimTree",
    } },
  },
})
