local notify = require("notify")
local dressing = require("dressing")
local autopairs = require("nvim-autopairs")
local comment = require("Comment")
local fterm = require("FTerm")
local colorpicker = require("color-picker")

vim.notify = notify

notify.setup({
  stages = "slide",
  background_colour = "NormalFloat",
  icons = {
    ERROR = _G.icons.diagnostic.Error,
    WARN = _G.icons.diagnostic.Warn,
    INFO = _G.icons.diagnostic.Info,
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

_G.terminals = {}
local toggle_terminal = function(name)
  if _G.terminals[name] == nil then
    _G.terminals[name] = fterm:new({
      hl = "NormalFloat",
      border = "rounded",
      on_exit = function()
        terminals[name] = nil

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

colorpicker.setup({
  border = "rounded",
  icons = { "=", ">" },
})

vim.keymap.set("n", "\\", function()
  local name = vim.fn.getcharstr()
  if name == "" then return end

  toggle_terminal(name)
end)
vim.keymap.set({ "n", "t" }, "<c-\\>", function()
  if _G.lastname == nil then return end
  toggle_terminal(_G.lastname)
end)
vim.keymap.set("n", "<leader>c", "<cmd>PickColor<cr>")
