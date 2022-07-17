local notify = require("notify")
local dressing = require("dressing")
local autopairs = require("nvim-autopairs")
local comment = require("Comment")
local Term = require("FTerm.terminal") -- TODO: use the root

vim.notify = notify

notify.setup({
  stages = "slide",
  background_colour = "NormalFloat",
  icons = {
    ERROR = _G.symbols.diagnostic.Error,
    WARN = _G.symbols.diagnostic.Warn,
    INFO = _G.symbols.diagnostic.Info,
  },
})

dressing.setup({
  input = {
    enabled = true,
    relative = "editor",
    border = "rounded",
    winblend = 0,
    insert_only = false,
  },
  select = {
    enabled = true,
  },
})

autopairs.setup({
  check_ts = true,
})

comment.setup({
  mappings = {
    basic = true,
    extra = true,
    extended = true,
  },
})

local terms = {}
local toggleterm = function(char)
  if terms[char] == nil then
    terms[char] = Term:new():setup({
      hl = "NormalFloat",
      border = "rounded",
      on_exit = function()
        if _G.lastchar == char then
          _G.lastchar = "\\"
        end

        terms[char] = nil
      end,
    })
  end

  _G.lastchar = char
  terms[char]:toggle()
end

vim.keymap.set("n", "\\", function()
  local char = vim.fn.getcharstr()
  if char == "" then return end

  toggleterm(char)
end)
vim.keymap.set({ "n", "t" }, "<c-\\>", function()
  if _G.lastchar == nil then
    _G.lastchar = "\\"
  end

  toggleterm(_G.lastchar)
end)
