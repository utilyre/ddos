local onedark = require("onedark")

onedark.setup({
  style = "dark",
  colors = {
    dark_grey = "#474d59",
  },
  highlights = {
    LspReferenceText = { bg = "$dark_grey", fmt = "none" },
    LspReferenceRead = { bg = "$dark_grey", fmt = "none" },
    LspReferenceWrite = { bg = "$dark_grey", fmt = "none" },
  },
})

onedark.load()
