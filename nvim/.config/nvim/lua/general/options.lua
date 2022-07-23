vim.g.mapleader = " "

vim.opt.clipboard = "unnamedplus"
vim.opt.writebackup = false
vim.opt.undofile = true

vim.opt.timeout = false
vim.opt.timeoutlen = 50
vim.opt.updatetime = 500

vim.opt.termguicolors = true
vim.opt.splitright = true
vim.opt.splitbelow = true
vim.opt.scrolloff = 2
vim.opt.sidescrolloff = 2

vim.opt.signcolumn = "yes"
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.cursorline = true
vim.opt.list = true
vim.opt.listchars:append("tab:  ,trail:·")

vim.opt.cmdheight = 0
vim.opt.incsearch = true
vim.opt.ignorecase = true
vim.opt.smartcase = true

vim.opt.pumheight = 10
vim.opt.completeopt = {}

vim.opt.wrap = false
vim.opt.expandtab = true
vim.opt.shiftwidth = 2
vim.opt.tabstop = 2
vim.opt.iskeyword:append("-")

local Autocmds = vim.api.nvim_create_augroup("Autocmds", {})
vim.api.nvim_create_autocmd("FileType", {
  group = Autocmds,
  pattern = { "gitcommit", "markdown" },
  callback = function() vim.opt_local.spell = true end,
})
vim.api.nvim_create_autocmd("BufEnter", {
  group = Autocmds,
  command = "set formatoptions-=cro",
})
vim.api.nvim_create_autocmd("TextYankPost", {
  group = Autocmds,
  callback = vim.get_hof(vim.highlight.on_yank, { higroup = "Visual", on_visual = false }),
})
vim.api.nvim_create_autocmd("InsertEnter", {
  group = Autocmds,
  callback = function() vim.opt.timeout = true end,
})
vim.api.nvim_create_autocmd("InsertLeave", {
  group = Autocmds,
  callback = function() vim.opt.timeout = false end,
})
