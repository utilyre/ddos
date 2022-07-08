local navic = require("nvim-navic")
local devicons = require("nvim-web-devicons")

navic.setup({
  separator = " %#Delimiter#" .. vim.g.symbols.ui.Chevron .. "%* ",
  icons = {
    File = "%#CmpItemKindFile#" .. vim.g.symbols.kind.File .. "%* ",
    Package = "%#CmpItemKindFolder#" .. vim.g.symbols.kind.Folder .. "%* ",
    Module = "%#CmpItemKindModule#" .. vim.g.symbols.kind.Module .. "%* ",
    Namespace = "%#CmpItemKindModule#" .. vim.g.symbols.kind.Module .. "%* ",
    Class = "%#CmpItemKindClass#" .. vim.g.symbols.kind.Class .. "%* ",
    Constructor = "%#CmpItemKindConstructor#" .. vim.g.symbols.kind.Constructor .. "%* ",
    Field = "%#CmpItemKindField#" .. vim.g.symbols.kind.Field .. "%* ",
    Property = "%#CmpItemKindProperty#" .. vim.g.symbols.kind.Property .. "%* ",
    Method = "%#CmpItemKindMethod#" .. vim.g.symbols.kind.Method .. "%* ",
    Struct = "%#CmpItemKindStruct#" .. vim.g.symbols.kind.Struct .. "%* ",
    Event = "%#CmpItemKindEvent#" .. vim.g.symbols.kind.Event .. "%* ",
    Interface = "%#CmpItemKindInterface#" .. vim.g.symbols.kind.Interface .. "%* ",
    Enum = "%#CmpItemKindEnum#" .. vim.g.symbols.kind.Enum .. "%* ",
    EnumMember = "%#CmpItemKindEnumMember#" .. vim.g.symbols.kind.EnumMember .. "%* ",
    Constant = "%#CmpItemKindConstant#" .. vim.g.symbols.kind.Constant .. "%* ",
    Function = "%#CmpItemKindFunction#" .. vim.g.symbols.kind.Function .. "%* ",
    TypeParameter = "%#CmpItemKindTypeParameter#" .. vim.g.symbols.kind.TypeParameter .. "%* ",
    Variable = "%#CmpItemKindVariable#" .. vim.g.symbols.kind.Variable .. "%* ",
    Operator = "%#CmpItemKindOperator#" .. vim.g.symbols.kind.Operator .. "%* ",
    Null = "%#CmpItemKindValue#" .. vim.g.symbols.type.Null .. "%* ",
    Boolean = "%#CmpItemKindValue#" .. vim.g.symbols.type.Boolean .. "%* ",
    Number = "%#CmpItemKindValue#" .. vim.g.symbols.type.Number .. "%* ",
    String = "%#CmpItemKindValue#" .. vim.g.symbols.type.String .. "%* ",
    Key = "%#CmpItemKindValue#" .. vim.g.symbols.type.String .. "%* ",
    Array = "%#CmpItemKindValue#" .. vim.g.symbols.type.Array .. "%* ",
    Object = "%#CmpItemKindValue#" .. vim.g.symbols.type.Object .. "%* ",
  },
})

local gNavic = vim.api.nvim_create_augroup("Navic", {})
vim.api.nvim_create_autocmd({ "BufWinEnter", "BufWritePost", "CursorMoved", "CursorMovedI", "TextChanged", "TextChangedI" }, {
  group = gNavic,
  callback = function()
    if vim.bo.buftype ~= "" or vim.api.nvim_win_get_config(0).relative ~= "" then
      vim.opt_local.winbar = nil
      return
    end

    local filepath = vim.fn.expand("%:.:h") .. "/"
    if filepath ~= "//" and filepath:sub(1, 1) == "/" then filepath = "/" .. filepath end
    if filepath == "./" then filepath = "" end

    local icon, highlight = devicons.get_icon_by_filetype(vim.bo.filetype, { default = true })
    local filename = vim.fn.expand("%:t")
    if vim.str_isempty(filename) then return end

    vim.opt_local.winbar = " " .. vim.str_gsub(filepath, "/", " %%#Delimiter#" .. vim.g.symbols.ui.Chevron .. "%%* ", 2) .. "%#" .. highlight .. "#" .. icon .. "%* " .. "%#" .. (vim.bo.modified and "BufferCurrentMod" or "BufferCurrent") .. "#" .. filename .. "%*"

    if not navic.is_available() then return end
    local location = navic.get_location()
    vim.opt_local.winbar:append(" %#Delimiter#" .. vim.g.symbols.ui.Chevron .. "%* " .. (vim.str_isempty(location) and "%#NonText#…%*" or location))
  end,
})
