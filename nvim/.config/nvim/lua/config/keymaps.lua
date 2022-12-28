vim.g.mapleader = " "

vim.keymap.set("n", "<cr>", "<cr>")
vim.keymap.set("n", "<c-i>", "<c-i>")
vim.keymap.set("n", "<c-[>", "<c-[>")

vim.keymap.set("i", "jk", "<esc>")
vim.keymap.set("i", "kj", "<esc>")
vim.keymap.set("n", "<s-y>", "y$")

vim.keymap.set("n", "<c-h>", vim.callback(vim.cmd.wincmd, "h"))
vim.keymap.set("n", "<c-l>", vim.callback(vim.cmd.wincmd, "l"))
vim.keymap.set("n", "<c-k>", vim.callback(vim.cmd.wincmd, "k"))
vim.keymap.set("n", "<c-j>", vim.callback(vim.cmd.wincmd, "j"))

vim.keymap.set("n", "<leader>w", vim.callback(vim.cmd.write))
vim.keymap.set("n", "<leader>q", vim.callback(vim.cmd.quit))
vim.keymap.set("n", "<leader>c", vim.callback(vim.cmd.bdelete))
vim.keymap.set("n", "<leader>s", vim.callback(vim.cmd.split))
vim.keymap.set("n", "<leader>v", vim.callback(vim.cmd.vsplit))
vim.keymap.set("n", "<leader>u", vim.callback(vim.cmd.nohlsearch))

vim.api.nvim_create_augroup("keymaps", {})
vim.api.nvim_create_autocmd("FileType", {
  group = "keymaps",
  pattern = "qf",
  callback = function(a)
    vim.keymap.set("n", "q", vim.callback(vim.cmd.cclose), { buffer = a.buf })
  end,
})
