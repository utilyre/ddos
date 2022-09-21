local devicons = require("nvim-web-devicons")
local neodim = require("neodim")
local tokyonight = require("tokyonight")
local colors = require("tokyonight.colors")

devicons.setup({
  default = true,
})

neodim.setup({
  alpha = 0.6,
  blend_color = colors.setup().bg,
  hide = {
    signs = false,
  }
})

tokyonight.setup({
  on_colors = function(c)
    c.bg_statusline = "none"
  end,
  on_highlights = function(hl)
    hl.NavicText = { link = "Normal" }
    hl.NavicSeparator = { link = "Conceal" }
    hl.NavicIconsFile = { link = "CmpItemKindFile" }
    hl.NavicIconsPackage = { link = "CmpItemKindFolder" }
    hl.NavicIconsModule = { link = "CmpItemKindModule" }
    hl.NavicIconsNamespace = { link = "CmpItemKindModule" }
    hl.NavicIconsClass = { link = "CmpItemKindClass" }
    hl.NavicIconsConstructor = { link = "CmpItemKindConstructor" }
    hl.NavicIconsField = { link = "CmpItemKindField" }
    hl.NavicIconsProperty = { link = "CmpItemKindProperty" }
    hl.NavicIconsMethod = { link = "CmpItemKindMethod" }
    hl.NavicIconsStruct = { link = "CmpItemKindStruct" }
    hl.NavicIconsEvent = { link = "CmpItemKindEvent" }
    hl.NavicIconsInterface = { link = "CmpItemKindInterface" }
    hl.NavicIconsEnum = { link = "CmpItemKindEnum" }
    hl.NavicIconsEnumMember = { link = "CmpItemKindEnumMember" }
    hl.NavicIconsConstant = { link = "CmpItemKindConstant" }
    hl.NavicIconsFunction = { link = "CmpItemKindFunction" }
    hl.NavicIconsTypeParameter = { link = "CmpItemKindTypeParameter" }
    hl.NavicIconsVariable = { link = "CmpItemKindVariable" }
    hl.NavicIconsOperator = { link = "CmpItemKindOperator" }
    hl.NavicIconsNull = { link = "CmpItemKindValue" }
    hl.NavicIconsBoolean = { link = "CmpItemKindValue" }
    hl.NavicIconsNumber = { link = "CmpItemKindValue" }
    hl.NavicIconsString = { link = "CmpItemKindValue" }
    hl.NavicIconsKey = { link = "CmpItemKindValue" }
    hl.NavicIconsArray = { link = "CmpItemKindValue" }
    hl.NavicIconsObject = { link = "CmpItemKindValue" }
  end,
})

tokyonight.colorscheme()
