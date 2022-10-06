local tokyonight = require("tokyonight")

tokyonight.setup({
  style = "night",
  on_colors = function(colors)
    colors.bg_statusline = "none"
  end,
  on_highlights = function(highlights, colors)
    highlights.TelescopeTitle = { background = colors.bg_float, foreground = colors.blue, bold = true }
    highlights.TelescopePromptPrefix = { foreground = colors.yellow }
    highlights.TelescopeSelectionCaret = { background = colors.bg_visual, foreground = colors.teal }
    highlights.TelescopeMultiIcon = { foreground = colors.red }
    highlights.TelescopeMultiSelection = { bold = true, italic = true }

    highlights.NavicText = highlights.Normal
    highlights.NavicSeparator = highlights.Conceal
    highlights.NavicIconsFile = highlights.CmpItemKindFile
    highlights.NavicIconsPackage = highlights.CmpItemKindFolder
    highlights.NavicIconsModule = highlights.CmpItemKindModule
    highlights.NavicIconsNamespace = highlights.CmpItemKindModule
    highlights.NavicIconsClass = highlights.CmpItemKindClass
    highlights.NavicIconsConstructor = highlights.CmpItemKindConstructor
    highlights.NavicIconsField = highlights.CmpItemKindField
    highlights.NavicIconsProperty = highlights.CmpItemKindProperty
    highlights.NavicIconsMethod = highlights.CmpItemKindMethod
    highlights.NavicIconsStruct = highlights.CmpItemKindStruct
    highlights.NavicIconsEvent = highlights.CmpItemKindEvent
    highlights.NavicIconsInterface = highlights.CmpItemKindInterface
    highlights.NavicIconsEnum = highlights.CmpItemKindEnum
    highlights.NavicIconsEnumMember = highlights.CmpItemKindEnumMember
    highlights.NavicIconsConstant = highlights.CmpItemKindConstant
    highlights.NavicIconsFunction = highlights.CmpItemKindFunction
    highlights.NavicIconsTypeParameter = highlights.CmpItemKindTypeParameter
    highlights.NavicIconsVariable = highlights.CmpItemKindVariable
    highlights.NavicIconsOperator = highlights.CmpItemKindOperator
    highlights.NavicIconsNull = highlights.CmpItemKindValue
    highlights.NavicIconsBoolean = highlights.CmpItemKindValue
    highlights.NavicIconsNumber = highlights.CmpItemKindValue
    highlights.NavicIconsString = highlights.CmpItemKindValue
    highlights.NavicIconsKey = highlights.CmpItemKindValue
    highlights.NavicIconsArray = highlights.CmpItemKindValue
    highlights.NavicIconsObject = highlights.CmpItemKindValue
  end,
})
tokyonight.colorscheme()
