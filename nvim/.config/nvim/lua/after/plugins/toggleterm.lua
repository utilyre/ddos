local toggleterm = require("toggleterm")

toggleterm.setup({
  open_mapping = "<c-_>",
  direction = "float",
  float_opts = { border = "rounded" },
  highlights = {
    NormalFloat = { link = "NormalFloat" },
    FloatBorder = { link = "FloatBorder" },
  },
})
