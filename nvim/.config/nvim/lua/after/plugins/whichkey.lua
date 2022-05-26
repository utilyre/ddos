local whichkey = require("which-key")

whichkey.setup({
  ignore_missing = true,
  operators = {
    gc = "Comment",
    gb = "Block Comment",
  },
  window = {
    border = "rounded",
  },
  layout = {
    align = "center",
  },
  icons = {
    breadcrumb = vim.g.symbols.ui.Chevron,
    separator = vim.g.symbols.ui.Separator,
    group = vim.g.symbols.ui.Group,
  },
})

vim.keymap.set("n", "<leader>", "<nop>")
vim.keymap.set("n", "<c-h>", "<cmd>wincmd h<cr>")
vim.keymap.set("n", "<c-j>", "<cmd>wincmd j<cr>")
vim.keymap.set("n", "<c-k>", "<cmd>wincmd k<cr>")
vim.keymap.set("n", "<c-l>", "<cmd>wincmd l<cr>")
vim.keymap.set("n", "<s-y>", "y$")
vim.keymap.set("t", "<c-_>", "<c-\\><c-n>")
vim.keymap.set("i", "jk", "<esc>")
vim.keymap.set("i", "kj", "<esc>")

whichkey.register({
  q = { "<cmd>quitall<cr>", "Quit" },
  c = { "<cmd>quit<cr>", "Close" },
  w = { "<cmd>write<cr>", "Write" },
  h = { "<cmd>split<cr>", "Horizontal" },
  v = { "<cmd>vsplit<cr>", "Vertical" },
  t = { "<cmd>terminal<cr>", "Terminal" },
  u = { "<cmd>nohlsearch<cr>", "Unselect" },
  s = { "<cmd>setlocal spell!<cr>", "Spell" },
}, { prefix = "<leader>" })
