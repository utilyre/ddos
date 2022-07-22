local luasnip = require("luasnip")
local spoon = require("spoon")

luasnip.config.setup({
  update_events = "TextChanged,TextChangedI",
  region_check_events = "CursorMoved,CursorMovedI",
})

spoon.setup({
  preferSingleQuotes = false,
})
