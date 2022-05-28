local onedark = require("onedark")

onedark.setup({
  style = "dark",
  transparent = true,
  code_style = {
    comments = "italic",
    keywords = "italic",
  },
  highlights = {
    NvimTreeNormal = { bg = "$bg_d" },
  },
})

onedark.load()
