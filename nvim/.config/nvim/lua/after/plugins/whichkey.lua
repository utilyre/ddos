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
  w = { F(vim.cmd, "write"), "Write" },
  q = { F(vim.cmd, "quit"), "Quit" },
  c = { F(vim.cmd, "bdelete"), "Close" },
  n = { F(vim.cmd, "enew"), "New" },
  t = { F(vim.cmd, "terminal"), "Terminal" },
  s = { F(vim.cmd, "split"), "Split" },
  v = { F(vim.cmd, "vsplit"), "VSplit" },
  u = { F(vim.cmd, "nohlsearch"), "Unselect" },
}, { prefix = "<leader>" })
