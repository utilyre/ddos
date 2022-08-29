local luasnip = require("luasnip")

luasnip.config.setup({
  update_events = "TextChanged,TextChangedI",
  region_check_events = "CursorMoved,CursorMovedI",
})
