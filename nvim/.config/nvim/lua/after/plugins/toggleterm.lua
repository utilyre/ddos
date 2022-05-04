local toggleterm = require("toggleterm")
local Terminal = require("toggleterm.terminal").Terminal
local whichkey = require("which-key")

toggleterm.setup({
  direction = "float",
  open_mapping = "<c-_>",
})

whichkey.register({
  t = { function()
    vim.ui.input({ prompt = "Command: " }, function(input)
      if input == nil then return end
      Terminal:new({ cmd = input }):toggle()
    end)
  end, "Terminal" },
}, { prefix = "<leader>" })
