local jabs = require("jabs")
local whichkey = require("which-key")

jabs.setup({
  position = "center",
  border = "rounded",
})

whichkey.register({
  q = { "<cmd>quitall<cr>", "Quit" },
  w = { "<cmd>write<cr>", "Write" },
  n = { "<cmd>enew<cr>", "New" },
  b = {"<cmd>JABSOpen<cr>", "Buffers"}
}, { prefix = "<leader>" })
