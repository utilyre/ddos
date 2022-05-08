local onedark = require("onedark")

onedark.setup({
  style = "dark",
  transparent = true,
  code_style = {
    keywords = "italic",
  },
  highlights = {
    NvimTreeNormal = { bg = "$bg_d" },
    BufferLineFill = { bg = "$bg0" },
    BufferLineBackground = { bg = "$bg0" },
    BufferLineSeparator = { bg = "$bg0" },
  },
})

onedark.load()
