local fterm = require("FTerm")

fterm.setup({
  hl = "NormalFloat",
  border = "rounded",
})

vim.keymap.set({ "n", "t" }, "<c-_>", vim.api.nvim_create_hof(fterm.toggle))
