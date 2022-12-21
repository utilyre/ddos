local fterm = require("FTerm")

fterm.setup({
  hl = "NormalFloat",
  border = "rounded",
})

vim.keymap.set({ "n", "t" }, "<c-\\>", vim.callback(fterm.toggle))
