local notify = require("notify")
local dressing = require("dressing")
local indentblankline = require("indent_blankline")
local autopairs = require("nvim-autopairs")
local comment = require("Comment")
local fterm = require("FTerm")

notify.setup({
  stages = "fade",
  background_colour = "NormalFloat",
  icons = {
    ERROR = _G.icons.diagnostic.Error,
    WARN = _G.icons.diagnostic.Warn,
    INFO = _G.icons.diagnostic.Info,
  },
})

vim.notify = notify

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

indentblankline.setup({
  show_current_context = true,
  show_trailing_blankline_indent = false,
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

_G.terminals = {}
local toggle_name = function(name)
  if _G.terminals[name] == nil then
    _G.terminals[name] = fterm:new({
      hl = "NormalFloat",
      border = "rounded",
      on_exit = function()
        _G.terminals[name] = nil

        if _G.lastname == name then
          for i, lastname in ipairs(vim.tbl_keys(_G.terminals)) do
            _G.lastname = lastname
            return
          end

          _G.lastname = nil
        end
      end,
    })
  end

  _G.lastname = name
  _G.terminals[name]:toggle()
end

vim.keymap.set({ "n", "t" }, "<c-\\>", function()
  if _G.lastname == nil then
    return
  end

  toggle_name(_G.lastname)
end)
vim.keymap.set("n", "\\a", vim.get_hof(toggle_name, "a"))
vim.keymap.set("n", "\\b", vim.get_hof(toggle_name, "b"))
vim.keymap.set("n", "\\c", vim.get_hof(toggle_name, "c"))
vim.keymap.set("n", "\\d", vim.get_hof(toggle_name, "d"))
vim.keymap.set("n", "\\e", vim.get_hof(toggle_name, "e"))
vim.keymap.set("n", "\\f", vim.get_hof(toggle_name, "f"))
vim.keymap.set("n", "\\g", vim.get_hof(toggle_name, "g"))
vim.keymap.set("n", "\\h", vim.get_hof(toggle_name, "h"))
vim.keymap.set("n", "\\i", vim.get_hof(toggle_name, "i"))
vim.keymap.set("n", "\\j", vim.get_hof(toggle_name, "j"))
vim.keymap.set("n", "\\k", vim.get_hof(toggle_name, "k"))
vim.keymap.set("n", "\\l", vim.get_hof(toggle_name, "l"))
vim.keymap.set("n", "\\m", vim.get_hof(toggle_name, "m"))
vim.keymap.set("n", "\\n", vim.get_hof(toggle_name, "n"))
vim.keymap.set("n", "\\o", vim.get_hof(toggle_name, "o"))
vim.keymap.set("n", "\\p", vim.get_hof(toggle_name, "p"))
vim.keymap.set("n", "\\q", vim.get_hof(toggle_name, "q"))
vim.keymap.set("n", "\\r", vim.get_hof(toggle_name, "r"))
vim.keymap.set("n", "\\s", vim.get_hof(toggle_name, "s"))
vim.keymap.set("n", "\\t", vim.get_hof(toggle_name, "t"))
vim.keymap.set("n", "\\u", vim.get_hof(toggle_name, "u"))
vim.keymap.set("n", "\\v", vim.get_hof(toggle_name, "v"))
vim.keymap.set("n", "\\w", vim.get_hof(toggle_name, "w"))
vim.keymap.set("n", "\\x", vim.get_hof(toggle_name, "x"))
vim.keymap.set("n", "\\y", vim.get_hof(toggle_name, "y"))
vim.keymap.set("n", "\\z", vim.get_hof(toggle_name, "z"))
