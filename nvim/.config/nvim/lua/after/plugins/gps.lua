local gps = require("nvim-gps")
local devicons = require("nvim-web-devicons")

gps.setup({
  icons = {
    ["class-name"] = "%#CmpItemKindClass#" .. " " .. "%*",
    ["function-name"] = "%#CmpItemKindFunction#" .. " " .. "%*",
    ["method-name"] = "%#CmpItemKindMethod#" .. " " .. "%*",
    ["container-name"] = "%#CmpItemKindProperty#" .. " " .. "%*",
    ["tag-name"] = "%#CmpItemKindKeyword#" .. " " .. "%*",
    ["mapping-name"] = "%#CmpItemKindProperty#" .. " " .. "%*",
    ["sequence-name"] = "%CmpItemKindProperty#" .. " " .. "%*",
    ["null-name"] = "%CmpItemKindField#" .. " " .. "%*",
    ["boolean-name"] = "%CmpItemKindValue#" .. " " .. "%*",
    ["integer-name"] = "%CmpItemKindValue#" .. " " .. "%*",
    ["float-name"] = "%CmpItemKindValue#" .. " " .. "%*",
    ["string-name"] = "%CmpItemKindValue#" .. " " .. "%*",
    ["array-name"] = "%CmpItemKindProperty#" .. " " .. "%*",
    ["object-name"] = "%CmpItemKindProperty#" .. " " .. "%*",
    ["number-name"] = "%CmpItemKindValue#" .. " " .. "%*",
    ["table-name"] = "%CmpItemKindProperty#" .. " " .. "%*",
    ["date-name"] = "%CmpItemKindValue#" .. " " .. "%*",
    ["date-time-name"] = "%CmpItemKindValue#" .. " " .. "%*",
    ["inline-table-name"] = "%CmpItemKindProperty#" .. " " .. "%*",
    ["time-name"] = "%CmpItemKindValue#" .. " " .. "%*",
    ["module-name"] = "%CmpItemKindModule#" .. " " .. "%*",
  },
})

local gGps = vim.api.nvim_create_augroup("Gps", {})
vim.api.nvim_create_autocmd({ "BufEnter", "CursorMoved", "CursorMovedI" }, {
  group = gGps,
  callback = function()
    if vim.bo.buftype ~= "" then return end

    local filename = vim.fn.expand("%:t")
    local extension = vim.fn.expand("%:e")
    local icon = devicons.get_icon_color(filename, extension)

    vim.opt_local.winbar = "     %#DevIcon" .. extension .. "#" .. icon .. "%* " .. filename

    if not gps.is_available() then return end
    local location = gps.get_location()
    if location == "" then return end

    vim.opt_local.winbar:append(" > " .. location)
  end,
})
