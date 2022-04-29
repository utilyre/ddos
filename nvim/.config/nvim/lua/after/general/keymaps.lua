vim.keymap.set("n", "<leader>", "<nop>")
vim.keymap.set("n", "<s-y>", "y$")
vim.keymap.set("i", "jj", "<esc>")

vim.keymap.set("c", "<c-h>", "<left>")
vim.keymap.set("c", "<c-j>", "<down>")
vim.keymap.set("c", "<c-k>", "<up>")
vim.keymap.set("c", "<c-l>", "<right>")

vim.keymap.set("n", "<c-h>", "<cmd>wincmd h<cr>")
vim.keymap.set("n", "<c-j>", "<cmd>wincmd j<cr>")
vim.keymap.set("n", "<c-k>", "<cmd>wincmd k<cr>")
vim.keymap.set("n", "<c-l>", "<cmd>wincmd l<cr>")

vim.keymap.set("n", "<s-q>", "<cmd>Bdelete<cr>")
vim.keymap.set("n", "<s-w>", "<cmd>write<cr>")
vim.keymap.set("n", "<s-e>", "<cmd>edit<cr>")
vim.keymap.set("n", "<s-h>", "<cmd>bprevious<cr>")
vim.keymap.set("n", "<s-l>", "<cmd>bnext<cr>")
