vim.g.mapleader = " "

vim.opt.clipboard = "unnamedplus"
vim.opt.writebackup = false
vim.opt.undofile = true

vim.opt.timeoutlen = 50
vim.opt.updatetime = 500

vim.opt.mouse = "a"
vim.opt.termguicolors = true
vim.opt.showmode = false
vim.opt.splitright = true
vim.opt.splitbelow = true
vim.opt.scrolloff = 2
vim.opt.sidescrolloff = 2

vim.opt.incsearch = true
vim.opt.ignorecase = true
vim.opt.smartcase = true

vim.opt.signcolumn = "yes:2"
vim.opt.number = true
vim.opt.relativenumber = true

vim.opt.wrap = false
vim.opt.cursorline = true
vim.opt.pumheight = 10
vim.opt.completeopt = {}

vim.opt.expandtab = true
vim.opt.shiftwidth = 2
vim.opt.tabstop = 2

vim.opt.list = true
vim.opt.listchars:append("tab:  ,trail:·")
vim.opt.iskeyword:append("-")

local gOptions = vim.api.nvim_create_augroup("Options", {})
vim.api.nvim_create_autocmd("FileType", {
  group = gOptions,
  pattern = { "gitcommit", "markdown" },
  callback = function() vim.opt_local.spell = true end,
})
vim.api.nvim_create_autocmd("BufEnter", {
  group = gOptions,
  command = "set formatoptions-=cro",
})
vim.api.nvim_create_autocmd("TextYankPost", {
  group = gOptions,
  callback = vim.api.nvim_create_hof(vim.highlight.on_yank, { higroup = "Visual", on_visual = false }),
})
