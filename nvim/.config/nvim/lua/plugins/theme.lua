local devicons = require("nvim-web-devicons")
local onedark = require("onedark")

devicons.setup({
  default = true,
})

onedark.setup({
  style = "dark",
  toggle_style_key = "<nop>",
  code_style = {
    comments = "italic",
    keywords = "italic",
  },
  highlights = {
    NotifyERRORBorder = { fg = "$red" },
    NotifyERRORIcon = { fg = "$red" },
    NotifyERRORTitle = { fg = "$red" },
    NotifyWARNBorder = { fg = "$yellow" },
    NotifyWARNIcon = { fg = "$yellow" },
    NotifyWARNTitle = { fg = "$yellow" },
    NotifyINFOBorder = { fg = "$cyan" },
    NotifyINFOIcon = { fg = "$cyan" },
    NotifyINFOTitle = { fg = "$cyan" },

    NavicText = { fg = "$fg" },
    NavicSeparator = { fg = "$light_grey" },
    NavicIconsFile = { fg = "$blue" },
    NavicIconsPackage = { fg = "$orange" },
    NavicIconsModule = { fg = "$orange" },
    NavicIconsNamespace = { fg = "$orange" },
    NavicIconsClass = { fg = "$yellow" },
    NavicIconsConstructor = { fg = "$blue" },
    NavicIconsField = { fg = "$purple" },
    NavicIconsProperty = { fg = "$cyan" },
    NavicIconsMethod = { fg = "$blue" },
    NavicIconsStruct = { fg = "$purple" },
    NavicIconsEvent = { fg = "$yellow" },
    NavicIconsInterface = { fg = "$green" },
    NavicIconsEnum = { fg = "$purple" },
    NavicIconsEnumMember = { fg = "$yellow" },
    NavicIconsConstant = { fg = "$orange" },
    NavicIconsFunction = { fg = "$blue" },
    NavicIconsTypeParameter = { fg = "$red" },
    NavicIconsVariable = { fg = "$purple" },
    NavicIconsOperator = { fg = "$red" },
    NavicIconsNull = { fg = "$orange" },
    NavicIconsBoolean = { fg = "$orange" },
    NavicIconsNumber = { fg = "$orange" },
    NavicIconsString = { fg = "$orange" },
    NavicIconsKey = { fg = "$orange" },
    NavicIconsArray = { fg = "$orange" },
    NavicIconsObject = { fg = "$orange" },

    IndentBlanklineContextChar = { fg = "$fg" },
    CommentTSNote = { fmt = "bold", fg = "$blue" },
    CommentTSWarning = { fmt = "bold", fg = "$yellow" },
    CommentTSDanger = { fmt = "bold", fg = "$red" },

    DiagnosticVirtualTextError = { bg = "none" },
    DiagnosticVirtualTextWarn = { bg = "none" },
    DiagnosticVirtualTextHint = { bg = "none" },
    DiagnosticVirtualTextInfo = { bg = "none" },
    DapStopped = { fg = "$green" },
    DapLogPoint = { fg = "$yellow" },
    DapBreakpoint = { fg = "$red" },
    DapBreakpointCondition = { fg = "$orange" },
    DapBreakpointRejected = { fg = "$grey" },
  },
})

onedark.load()
