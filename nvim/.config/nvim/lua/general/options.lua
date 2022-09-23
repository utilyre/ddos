vim.opt.clipboard = "unnamedplus"
vim.opt.writebackup = false
vim.opt.undofile = true

vim.opt.timeout = false
vim.opt.timeoutlen = 50

vim.opt.termguicolors = true
vim.opt.splitright = true
vim.opt.splitbelow = true
vim.opt.scrolloff = 2
vim.opt.sidescrolloff = 2

vim.opt.signcolumn = "yes:2"
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.cursorline = true
vim.opt.list = true
vim.opt.listchars:append("tab:  ,trail:·")
vim.opt.fillchars:append("eob: ")

vim.opt.showmode = false
vim.opt.incsearch = true
vim.opt.ignorecase = true
vim.opt.smartcase = true

vim.opt.pumheight = 10
vim.opt.completeopt = {}

vim.opt.wrap = false
vim.opt.expandtab = true
vim.opt.shiftwidth = 2
vim.opt.tabstop = 2

vim.api.nvim_create_augroup("options", {})
vim.api.nvim_create_autocmd("BufEnter", {
  group = "options",
  command = "set formatoptions-=cro",
})
vim.api.nvim_create_autocmd("TextYankPost", {
  group = "options",
  callback = vim.get_hof(vim.highlight.on_yank, { higroup = "Visual", on_visual = false }),
})
vim.api.nvim_create_autocmd("InsertEnter", {
  group = "options",
  callback = function()
    vim.opt.timeout = true
  end,
})
vim.api.nvim_create_autocmd("InsertLeave", {
  group = "options",
  callback = function()
    vim.opt.timeout = false
  end,
})
