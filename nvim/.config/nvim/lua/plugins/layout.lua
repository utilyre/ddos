local barbecue = require("barbecue")
local lualine = require("lualine")

barbecue.setup({
  separator = " %#Delimiter#" .. _G.icons.ui.Chevron .. "%* ",
  no_info_indicator = "%#NonText#…%*",
  icons = {
    File = "%#CmpItemKindFile#" .. _G.icons.kind.File .. "%* ",
    Package = "%#CmpItemKindFolder#" .. _G.icons.kind.Folder .. "%* ",
    Module = "%#CmpItemKindModule#" .. _G.icons.kind.Module .. "%* ",
    Namespace = "%#CmpItemKindModule#" .. _G.icons.kind.Module .. "%* ",
    Class = "%#CmpItemKindClass#" .. _G.icons.kind.Class .. "%* ",
    Constructor = "%#CmpItemKindConstructor#" .. _G.icons.kind.Constructor .. "%* ",
    Field = "%#CmpItemKindField#" .. _G.icons.kind.Field .. "%* ",
    Property = "%#CmpItemKindProperty#" .. _G.icons.kind.Property .. "%* ",
    Method = "%#CmpItemKindMethod#" .. _G.icons.kind.Method .. "%* ",
    Struct = "%#CmpItemKindStruct#" .. _G.icons.kind.Struct .. "%* ",
    Event = "%#CmpItemKindEvent#" .. _G.icons.kind.Event .. "%* ",
    Interface = "%#CmpItemKindInterface#" .. _G.icons.kind.Interface .. "%* ",
    Enum = "%#CmpItemKindEnum#" .. _G.icons.kind.Enum .. "%* ",
    EnumMember = "%#CmpItemKindEnumMember#" .. _G.icons.kind.EnumMember .. "%* ",
    Constant = "%#CmpItemKindConstant#" .. _G.icons.kind.Constant .. "%* ",
    Function = "%#CmpItemKindFunction#" .. _G.icons.kind.Function .. "%* ",
    TypeParameter = "%#CmpItemKindTypeParameter#" .. _G.icons.kind.TypeParameter .. "%* ",
    Variable = "%#CmpItemKindVariable#" .. _G.icons.kind.Variable .. "%* ",
    Operator = "%#CmpItemKindOperator#" .. _G.icons.kind.Operator .. "%* ",
    Null = "%#CmpItemKindValue#" .. _G.icons.type.Null .. "%* ",
    Boolean = "%#CmpItemKindValue#" .. _G.icons.type.Boolean .. "%* ",
    Number = "%#CmpItemKindValue#" .. _G.icons.type.Number .. "%* ",
    String = "%#CmpItemKindValue#" .. _G.icons.type.String .. "%* ",
    Key = "%#CmpItemKindValue#" .. _G.icons.type.String .. "%* ",
    Array = "%#CmpItemKindValue#" .. _G.icons.type.Array .. "%* ",
    Object = "%#CmpItemKindValue#" .. _G.icons.type.Object .. "%* ",
  },
})

lualine.setup({
  options = {
    globalstatus = true,
    section_separators = { left = _G.icons.ui.SectionLeft, right = _G.icons.ui.SectionRight },
    component_separators = { left = _G.icons.ui.ComponentLeft, right = _G.icons.ui.ComponentRight },
  },
  sections = {
    lualine_b = {
      { "branch" },
      { "diff" },
      { "diagnostics",
        update_in_insert = true,
        symbols = {
          error = _G.icons.diagnostic.Error .. " ",
          warn = _G.icons.diagnostic.Warn .. " ",
          hint = _G.icons.diagnostic.Hint .. " ",
          info = _G.icons.diagnostic.Info .. " ",
        } },
    },
    lualine_c = {
      { function()
        local names = vim.tbl_keys(_G.terminals)
        for i, name in ipairs(names) do
          if name == _G.lastname then table.remove(names, i) end
        end

        return (_G.lastname or "") .. table.concat(names)
      end },
    },
    lualine_x = {},
    lualine_y = { "encoding", "fileformat", "filetype" },
  },
})
