local zenmode = require("zen-mode")
local whichkey = require("which-key")

zenmode.setup({
  window = {
    backdrop = 1,
  },
})

whichkey.register({
  z = { zenmode.toggle, "Zen mode" },
}, { prefix = "<leader>" })
