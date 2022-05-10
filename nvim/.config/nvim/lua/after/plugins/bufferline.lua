local bufferline = require("bufferline")

bufferline.setup({
  options = {
    right_mouse_command = "Bdelete %d",
    show_close_icon = false,
    show_buffer_close_icons = false,
    indicator_icon = " ",
    separator_style = { " ", " " },
    left_trunc_marker = "",
    right_trunc_marker = "",
    offsets = { {
      text = "Explorer",
      filetype = "NvimTree",
    } },
  },
})
