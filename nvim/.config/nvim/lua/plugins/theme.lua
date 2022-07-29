local devicons = require("nvim-web-devicons")
local onedark = require("onedark")

devicons.setup({
  default = true,
})

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
    NvimTreeExecFile = { fg = "$green" },
    CommentTSNote = { fmt = "bold", fg = "$blue" },
    CommentTSWarning = { fmt = "bold", fg = "$yellow" },
    CommentTSDanger = { fmt = "bold", fg = "$red" },
    IndentBlanklineContextChar = { fg = "$fg" },
    DapStopped = { fg = "$green" },
    DapLogPoint = { fg = "$yellow" },
    DapBreakpoint = { fg = "$red" },
    DapBreakpointCondition = { fg = "$orange" },
    DapBreakpointRejected = { fg = "$grey" },
  },
})

onedark.load()
