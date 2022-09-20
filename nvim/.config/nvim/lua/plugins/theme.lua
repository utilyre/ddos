local devicons = require("nvim-web-devicons")
local tokyonight = require("tokyonight")

devicons.setup({
  default = true,
})

tokyonight.setup({
  on_colors = function(colors)
    colors.bg_statusline = "none"
  end,
  on_highlights = function(highlights)
    highlights.NavicText = { link = "Normal" }
    highlights.NavicSeparator = { link = "Conceal" }
    highlights.NavicIconsFile = { link = "CmpItemKindFile" }
    highlights.NavicIconsPackage = { link = "CmpItemKindFolder" }
    highlights.NavicIconsModule = { link = "CmpItemKindModule" }
    highlights.NavicIconsNamespace = { link = "CmpItemKindModule" }
    highlights.NavicIconsClass = { link = "CmpItemKindClass" }
    highlights.NavicIconsConstructor = { link = "CmpItemKindConstructor" }
    highlights.NavicIconsField = { link = "CmpItemKindField" }
    highlights.NavicIconsProperty = { link = "CmpItemKindProperty" }
    highlights.NavicIconsMethod = { link = "CmpItemKindMethod" }
    highlights.NavicIconsStruct = { link = "CmpItemKindStruct" }
    highlights.NavicIconsEvent = { link = "CmpItemKindEvent" }
    highlights.NavicIconsInterface = { link = "CmpItemKindInterface" }
    highlights.NavicIconsEnum = { link = "CmpItemKindEnum" }
    highlights.NavicIconsEnumMember = { link = "CmpItemKindEnumMember" }
    highlights.NavicIconsConstant = { link = "CmpItemKindConstant" }
    highlights.NavicIconsFunction = { link = "CmpItemKindFunction" }
    highlights.NavicIconsTypeParameter = { link = "CmpItemKindTypeParameter" }
    highlights.NavicIconsVariable = { link = "CmpItemKindVariable" }
    highlights.NavicIconsOperator = { link = "CmpItemKindOperator" }
    highlights.NavicIconsNull = { link = "CmpItemKindValue" }
    highlights.NavicIconsBoolean = { link = "CmpItemKindValue" }
    highlights.NavicIconsNumber = { link = "CmpItemKindValue" }
    highlights.NavicIconsString = { link = "CmpItemKindValue" }
    highlights.NavicIconsKey = { link = "CmpItemKindValue" }
    highlights.NavicIconsArray = { link = "CmpItemKindValue" }
    highlights.NavicIconsObject = { link = "CmpItemKindValue" }
  end,
})

tokyonight.colorscheme()
