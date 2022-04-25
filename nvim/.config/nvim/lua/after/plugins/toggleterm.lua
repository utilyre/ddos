local toggleterm = require("toggleterm")
local Terminal = require("toggleterm.terminal").Terminal

toggleterm.setup({
  size = 15,
})

_G.terminal = Terminal:new()
vim.keymap.set({ "n", "t" }, "<c-_>", function() _G.terminal:toggle() end)

_G.termexec = function(cmd)
  local instance = Terminal:new({ cmd = cmd, direction = "float" })
  instance:toggle()
end
