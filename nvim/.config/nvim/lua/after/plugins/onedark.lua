local onedark = require("onedark")

onedark.setup({
  style = "dark",
  transparent = true,
  toggle_style_key = "<nop>",
  code_style = {
    comments = "italic",
    keywords = "italic",
  },
  highlights = {
    NvimTreeNormal = { bg = "$bg_d" },
    NvimTreeOpenedFile = { fg = "$cyan", fmt = "bold" },
  },
})

onedark.load()
