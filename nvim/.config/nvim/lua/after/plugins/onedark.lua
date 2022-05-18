local onedark = require("onedark")

onedark.setup({
  style = "dark",
  transparent = true,
  code_style = {
    keywords = "italic",
  },
  highlights = {
    LspCodeLens = { fg = "$grey" },
    LspCodeLensSeparator = { fg = "$grey" },
    NvimTreeNormal = { bg = "$bg_d" },
  },
})

onedark.load()
