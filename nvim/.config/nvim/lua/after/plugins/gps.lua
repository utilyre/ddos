local gps = require("nvim-gps")
local devicons = require("nvim-web-devicons")

gps.setup({
  separator = " %#LineNr#" .. vim.g.symbols.ui.Chevron .. "%* ",
  icons = {
    ["module-name"] = "%CmpItemKindModule#" .. vim.g.symbols.kinds.Module .. "%* ",
    ["class-name"] = "%#CmpItemKindClass#" .. vim.g.symbols.kinds.Class .. "%* ",
    ["tag-name"] = "%#CmpItemKindProperty#" .. vim.g.symbols.kinds.Property .. "%* ",
    ["method-name"] = "%#CmpItemKindMethod#" .. vim.g.symbols.kinds.Method .. "%* ",
    ["container-name"] = "%#CmpItemKindStruct#" .. vim.g.symbols.kinds.Struct .. "%* ",
    ["null-name"] = "%CmpItemKindValue#" .. vim.g.symbols.type.Null .. "%* ",
    ["boolean-name"] = "%CmpItemKindValue#" .. vim.g.symbols.type.Boolean .. "%* ",
    ["number-name"] = "%CmpItemKindValue#" .. vim.g.symbols.type.Number .. "%* ",
    ["integer-name"] = "%CmpItemKindValue#" .. vim.g.symbols.type.Number .. "%* ",
    ["float-name"] = "%CmpItemKindValue#" .. vim.g.symbols.type.Number .. "%* ",
    ["string-name"] = "%CmpItemKindValue#" .. vim.g.symbols.type.String .. "%* ",
    ["array-name"] = "%CmpItemKindStruct#" .. vim.g.symbols.type.Array .. "%* ",
    ["object-name"] = "%CmpItemKindStruct#" .. vim.g.symbols.type.Object .. "%* ",
    ["function-name"] = "%#CmpItemKindFunction#" .. vim.g.symbols.kinds.Function .. "%* ",
  },
})

local gGps = vim.api.nvim_create_augroup("Gps", {})
vim.api.nvim_create_autocmd({ "BufEnter", "CursorMoved", "CursorMovedI" }, {
  group = gGps,
  callback = function()
    if vim.bo.buftype ~= "" then return end

    local filename = vim.fn.expand("%:t")
    local extension = vim.fn.expand("%:e")
    local icon = devicons.get_icon_color(filename, extension, { default = true })
    vim.opt_local.winbar = " %#DevIcon" .. extension .. "#" .. icon .. "%* " .. filename

    if not gps.is_available() then return end
    local location = gps.get_location()
    if location == "" then return end
    vim.opt_local.winbar:append(" %#LineNr#" .. vim.g.symbols.ui.Chevron .. "%* " .. location)
  end,
})
