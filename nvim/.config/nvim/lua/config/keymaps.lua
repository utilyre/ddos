vim.g.mapleader = " "

vim.keymap.set("n", "<cr>", "<cr>")
vim.keymap.set("n", "<c-i>", "<c-i>")
vim.keymap.set("n", "<c-[>", "<c-[>")

vim.keymap.set("i", "jk", "<esc>")
vim.keymap.set("i", "kj", "<esc>")
vim.keymap.set("n", "<s-y>", "y$")

vim.keymap.set("n", "<c-h>", vim.fun_lambda(vim.cmd.wincmd, "h"))
vim.keymap.set("n", "<c-j>", vim.fun_lambda(vim.cmd.wincmd, "j"))
vim.keymap.set("n", "<c-k>", vim.fun_lambda(vim.cmd.wincmd, "k"))
vim.keymap.set("n", "<c-l>", vim.fun_lambda(vim.cmd.wincmd, "l"))

vim.keymap.set("n", "<leader>w", vim.fun_lambda(vim.cmd.write))
vim.keymap.set("n", "<leader>q", vim.fun_lambda(vim.cmd.quit))
vim.keymap.set("n", "<leader>c", vim.fun_lambda(vim.cmd.bdelete))
vim.keymap.set("n", "<leader>s", vim.fun_lambda(vim.cmd.split))
vim.keymap.set("n", "<leader>v", vim.fun_lambda(vim.cmd.vsplit))
vim.keymap.set("n", "<leader>u", vim.fun_lambda(vim.cmd.nohlsearch))
