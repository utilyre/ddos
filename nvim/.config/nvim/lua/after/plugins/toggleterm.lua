local toggleterm = require("toggleterm")
local Terminal = require("toggleterm.terminal").Terminal

toggleterm.setup({
  size = 15,
})

_G.terminal = Terminal:new()
vim.keymap.set({ "n", "t" }, "<c-_>", function() _G.terminal:toggle() end)

vim.api.nvim_create_user_command(
  "Terminal",
  function(_)
    local instance = Terminal:new({ cmd = _.args, direction = "float" })
    instance:toggle()
  end,
  { nargs = 1 }
)
