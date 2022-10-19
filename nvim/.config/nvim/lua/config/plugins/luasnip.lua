local luasnip = require("luasnip")
local vscode = require("luasnip.loaders.from_vscode")

luasnip.config.setup({
  region_check_events = "CursorMoved",
})
vscode.lazy_load()
