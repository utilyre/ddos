local gps = require("nvim-gps")
local devicons = require("nvim-web-devicons")

gps.setup({
  languages = {
    bash = true,
    c = true,
    cpp = true,
    fennel = true,
    go = true,
    html = true,
    java = true,
    javascript = true,
    json = true,
    latex = true,
    lua = true,
    norg = true,
    ocaml = true,
    php = true,
    python = true,
    ruby = true,
    rust = true,
    toml = true,
    typescript = true,
    verilog = true,
    yaml = true,
    yang = true,
    zig = true,
  },
  separator = " %#LineNr#" .. vim.g.symbols.ui.Chevron .. "%* ",
  icons = {
    ["module-name"] = "%CmpItemKindModule#" .. vim.g.symbols.kind.Module .. "%* ",
    ["class-name"] = "%#CmpItemKindClass#" .. vim.g.symbols.kind.Class .. "%* ",
    ["tag-name"] = "%#CmpItemKindProperty#" .. vim.g.symbols.kind.Property .. "%* ",
    ["method-name"] = "%#CmpItemKindMethod#" .. vim.g.symbols.kind.Method .. "%* ",
    ["container-name"] = "%#CmpItemKindStruct#" .. vim.g.symbols.kind.Struct .. "%* ",
    ["null-name"] = "%#CmpItemKindValue#" .. vim.g.symbols.type.Null .. "%* ",
    ["boolean-name"] = "%#CmpItemKindValue#" .. vim.g.symbols.type.Boolean .. "%* ",
    ["number-name"] = "%#CmpItemKindValue#" .. vim.g.symbols.type.Number .. "%* ",
    ["integer-name"] = "%#CmpItemKindValue#" .. vim.g.symbols.type.Number .. "%* ",
    ["float-name"] = "%#CmpItemKindValue#" .. vim.g.symbols.type.Number .. "%* ",
    ["string-name"] = "%#CmpItemKindValue#" .. vim.g.symbols.type.String .. "%* ",
    ["array-name"] = "%#CmpItemKindStruct#" .. vim.g.symbols.type.Array .. "%* ",
    ["object-name"] = "%#CmpItemKindStruct#" .. vim.g.symbols.type.Object .. "%* ",
    ["function-name"] = "%#CmpItemKindFunction#" .. vim.g.symbols.kind.Function .. "%* ",
  },
})

local gGps = vim.api.nvim_create_augroup("Gps", {})
vim.api.nvim_create_autocmd({ "BufWinEnter", "BufWritePost", "CursorMoved", "CursorMovedI", "TextChanged", "TextChangedI" }, {
  group = gGps,
  callback = function()
    if not vim.tbl_contains({ "terminal", "" }, vim.bo.buftype) then
      vim.opt_local.winbar = nil
      return
    end

    local filename = vim.fn.expand("%:t")
    local icon, highlight = devicons.get_icon_by_filetype(vim.bo.filetype, { default = true })
    vim.opt_local.winbar = " %#" .. highlight .. "#" .. icon .. "%* %#" .. (vim.bo.modified and "BufferCurrentMod" or "BufferCurrent") .. "#" .. (vim.str_isempty(filename) and "[No Name]" or filename) .. "%*"

    if not gps.is_available() then return end
    local location = gps.get_location()
    if not vim.str_isempty(location) then
      vim.opt_local.winbar:append(" %#LineNr#" .. vim.g.symbols.ui.Chevron .. "%* " .. location)
    end
  end,
})
