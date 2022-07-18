local notify = require("notify")
local dressing = require("dressing")
local autopairs = require("nvim-autopairs")
local comment = require("Comment")
local fterm = require("FTerm")

vim.notify = notify

notify.setup({
  stages = "slide",
  background_colour = "NormalFloat",
  icons = {
    ERROR = vim.g.symbols.diagnostic.Error,
    WARN = vim.g.symbols.diagnostic.Warn,
    INFO = vim.g.symbols.diagnostic.Info,
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

vim.g.terminal = "\\"
local terminals = {}
local toggleterm = function(char)
  if terminals[char] == nil then
    terminals[char] = fterm:new({
      hl = "NormalFloat",
      border = "rounded",
      on_exit = function()
        if vim.g.terminal == char then
          vim.g.terminal = "\\"
        end

        terminals[char] = nil
      end,
    })
  end

  vim.g.terminal = char
  terminals[char]:toggle()
end

vim.keymap.set("n", "\\", function()
  local char = vim.fn.getcharstr()
  if char == "" then return end

  toggleterm(char)
end)
vim.keymap.set({ "n", "t" }, "<c-\\>", function()
  if vim.g.terminal == nil then
    vim.g.terminal = "\\"
  end

  toggleterm(vim.g.terminal)
end)
