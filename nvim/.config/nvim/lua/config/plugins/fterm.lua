local fterm = require("FTerm")

_G.terminals = {}
local toggle_terminal = function(key)
  key = key or _G.lastkey or "t"

  if _G.terminals[key] == nil then
    _G.terminals[key] = fterm:new({
      hl = "NormalFloat",
      border = "rounded",
      on_exit = function()
        _G.terminals[key] = nil

        local keys = vim.tbl_keys(_G.terminals)
        if _G.lastkey == key and #keys > 0 then
          _G.lastkey = keys[1]
        else
          _G.lastkey = nil
        end
      end,
    })
  end

  _G.lastkey = key
  _G.terminals[key]:toggle()
end

vim.keymap.set({ "n", "t" }, "<c-\\>", vim.callback(toggle_terminal))
vim.keymap.set("n", "\\a", vim.callback(toggle_terminal, "a"))
vim.keymap.set("n", "\\b", vim.callback(toggle_terminal, "b"))
vim.keymap.set("n", "\\c", vim.callback(toggle_terminal, "c"))
vim.keymap.set("n", "\\d", vim.callback(toggle_terminal, "d"))
vim.keymap.set("n", "\\e", vim.callback(toggle_terminal, "e"))
vim.keymap.set("n", "\\f", vim.callback(toggle_terminal, "f"))
vim.keymap.set("n", "\\g", vim.callback(toggle_terminal, "g"))
vim.keymap.set("n", "\\h", vim.callback(toggle_terminal, "h"))
vim.keymap.set("n", "\\i", vim.callback(toggle_terminal, "i"))
vim.keymap.set("n", "\\j", vim.callback(toggle_terminal, "j"))
vim.keymap.set("n", "\\k", vim.callback(toggle_terminal, "k"))
vim.keymap.set("n", "\\l", vim.callback(toggle_terminal, "l"))
vim.keymap.set("n", "\\m", vim.callback(toggle_terminal, "m"))
vim.keymap.set("n", "\\n", vim.callback(toggle_terminal, "n"))
vim.keymap.set("n", "\\o", vim.callback(toggle_terminal, "o"))
vim.keymap.set("n", "\\p", vim.callback(toggle_terminal, "p"))
vim.keymap.set("n", "\\q", vim.callback(toggle_terminal, "q"))
vim.keymap.set("n", "\\r", vim.callback(toggle_terminal, "r"))
vim.keymap.set("n", "\\s", vim.callback(toggle_terminal, "s"))
vim.keymap.set("n", "\\t", vim.callback(toggle_terminal, "t"))
vim.keymap.set("n", "\\u", vim.callback(toggle_terminal, "u"))
vim.keymap.set("n", "\\v", vim.callback(toggle_terminal, "v"))
vim.keymap.set("n", "\\w", vim.callback(toggle_terminal, "w"))
vim.keymap.set("n", "\\x", vim.callback(toggle_terminal, "x"))
vim.keymap.set("n", "\\y", vim.callback(toggle_terminal, "y"))
vim.keymap.set("n", "\\z", vim.callback(toggle_terminal, "z"))
