local whichkey = require("which-key")

whichkey.setup({
  ignore_missing = true,
  window = { border = "rounded" },
  layout = { align = "center" },
  operators = {
    gc = "Comment",
    gb = "BComment",
  },
  icons = {
    separator = vim.g.symbols.ui.Separator,
    group = vim.g.symbols.ui.Group,
    breadcrumb = vim.g.symbols.ui.Chevron,
  },
})

vim.keymap.set("n", "<c-h>", "<c-w>h")
vim.keymap.set("n", "<c-j>", "<c-w>j")
vim.keymap.set("n", "<c-k>", "<c-w>k")
vim.keymap.set("n", "<c-l>", "<c-w>l")
vim.keymap.set("n", "<s-y>", "y$")
vim.keymap.set("t", "<c-\\>", "<c-\\><c-n>")
vim.keymap.set("i", "jk", "<esc>")
vim.keymap.set("i", "kj", "<esc>")

whichkey.register({
  q = { "<cmd>quitall<cr>", "Quit" },
  c = { "<cmd>quit<cr>", "Close" },
  w = { "<cmd>write<cr>", "Write" },
  n = { "<cmd>enew<cr>", "New" },
  t = { "<cmd>terminal<cr>", "Terminal" },
  s = { "<cmd>split<cr>", "Split" },
  v = { "<cmd>vsplit<cr>", "VSplit" },
  u = { "<cmd>nohlsearch<cr>", "Unselect" },
}, { prefix = "<leader>" })
