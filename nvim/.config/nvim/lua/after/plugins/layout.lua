local barbecue = require("barbecue")
local lualine = require("lualine")

barbecue.setup({
  separator = " %#Delimiter#" .. _G.symbols.ui.Chevron .. "%* ",
  no_info_indicator = "%#NonText#…%*",
  icons = {
    File = "%#CmpItemKindFile#" .. _G.symbols.kind.File .. "%* ",
    Package = "%#CmpItemKindFolder#" .. _G.symbols.kind.Folder .. "%* ",
    Module = "%#CmpItemKindModule#" .. _G.symbols.kind.Module .. "%* ",
    Namespace = "%#CmpItemKindModule#" .. _G.symbols.kind.Module .. "%* ",
    Class = "%#CmpItemKindClass#" .. _G.symbols.kind.Class .. "%* ",
    Constructor = "%#CmpItemKindConstructor#" .. _G.symbols.kind.Constructor .. "%* ",
    Field = "%#CmpItemKindField#" .. _G.symbols.kind.Field .. "%* ",
    Property = "%#CmpItemKindProperty#" .. _G.symbols.kind.Property .. "%* ",
    Method = "%#CmpItemKindMethod#" .. _G.symbols.kind.Method .. "%* ",
    Struct = "%#CmpItemKindStruct#" .. _G.symbols.kind.Struct .. "%* ",
    Event = "%#CmpItemKindEvent#" .. _G.symbols.kind.Event .. "%* ",
    Interface = "%#CmpItemKindInterface#" .. _G.symbols.kind.Interface .. "%* ",
    Enum = "%#CmpItemKindEnum#" .. _G.symbols.kind.Enum .. "%* ",
    EnumMember = "%#CmpItemKindEnumMember#" .. _G.symbols.kind.EnumMember .. "%* ",
    Constant = "%#CmpItemKindConstant#" .. _G.symbols.kind.Constant .. "%* ",
    Function = "%#CmpItemKindFunction#" .. _G.symbols.kind.Function .. "%* ",
    TypeParameter = "%#CmpItemKindTypeParameter#" .. _G.symbols.kind.TypeParameter .. "%* ",
    Variable = "%#CmpItemKindVariable#" .. _G.symbols.kind.Variable .. "%* ",
    Operator = "%#CmpItemKindOperator#" .. _G.symbols.kind.Operator .. "%* ",
    Null = "%#CmpItemKindValue#" .. _G.symbols.type.Null .. "%* ",
    Boolean = "%#CmpItemKindValue#" .. _G.symbols.type.Boolean .. "%* ",
    Number = "%#CmpItemKindValue#" .. _G.symbols.type.Number .. "%* ",
    String = "%#CmpItemKindValue#" .. _G.symbols.type.String .. "%* ",
    Key = "%#CmpItemKindValue#" .. _G.symbols.type.String .. "%* ",
    Array = "%#CmpItemKindValue#" .. _G.symbols.type.Array .. "%* ",
    Object = "%#CmpItemKindValue#" .. _G.symbols.type.Object .. "%* ",
  },
})

lualine.setup({
  options = {
    globalstatus = true,
    section_separators = { left = _G.symbols.ui.SectionLeft, right = _G.symbols.ui.SectionRight },
    component_separators = { left = _G.symbols.ui.ComponentLeft, right = _G.symbols.ui.ComponentRight },
  },
  sections = {
    lualine_b = {
      { "branch" },
      { "diff" },
      { "diagnostics",
        update_in_insert = true,
        symbols = {
          error = _G.symbols.diagnostic.Error .. " ",
          warn = _G.symbols.diagnostic.Warn .. " ",
          hint = _G.symbols.diagnostic.Hint .. " ",
          info = _G.symbols.diagnostic.Info .. " ",
        } },
    },
    lualine_c = {},
    lualine_x = {},
    lualine_y = { "encoding", "fileformat", "filetype" },
  },
})
