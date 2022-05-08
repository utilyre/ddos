local autopairs = require("nvim-autopairs")
local completion = require("nvim-autopairs.completion.cmp")
local cmp = require("cmp")

autopairs.setup({
  check_ts = true,
})

cmp.event:on(
  "confirm_done",
  completion.on_confirm_done({ map_char = { tex = "" } })
)
