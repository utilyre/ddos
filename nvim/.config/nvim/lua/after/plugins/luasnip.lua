local luasnip = require("luasnip")
local vscode = require("luasnip.loaders.from_vscode")

luasnip.config.setup({
  update_events = "TextChanged,TextChangedI",
  region_check_events = "CursorMoved,CursorMovedI",
})

vscode.lazy_load()
