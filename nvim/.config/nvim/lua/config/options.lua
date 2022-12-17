vim.opt.clipboard = "unnamedplus"
vim.opt.writebackup = false
vim.opt.undofile = true

vim.opt.timeout = false
vim.opt.timeoutlen = 50

vim.opt.termguicolors = true
vim.opt.confirm = true
vim.opt.splitright = true
vim.opt.splitbelow = true
vim.opt.scrolloff = 2
vim.opt.sidescrolloff = 2

vim.opt.signcolumn = "yes:2"
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.showmode = false
vim.opt.list = true
vim.opt.listchars:append({
  tab = "  " .. vim.g.icons.space.Tab,
  trail = vim.g.icons.space.Trail,
})
vim.opt.fillchars:append({
  eob = " ",
})

vim.opt.incsearch = true
vim.opt.ignorecase = true
vim.opt.smartcase = true

vim.opt.pumheight = 16
vim.opt.completeopt = {}

vim.opt.wrap = false
vim.opt.expandtab = true
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2

vim.opt.spell = true
vim.opt.spelloptions:append({ "camel" })

vim.api.nvim_create_augroup("options", {})
vim.api.nvim_create_autocmd("InsertLeave", {
  group = "options",
  callback = function()
    vim.opt.timeout = false
  end,
})
vim.api.nvim_create_autocmd("InsertEnter", {
  group = "options",
  callback = function()
    vim.opt.timeout = true
  end,
})
vim.api.nvim_create_autocmd("FileType", {
  group = "options",
  callback = function()
    vim.opt.formatoptions = {}
  end,
})
vim.api.nvim_create_autocmd("TextYankPost", {
  group = "options",
  callback = vim.callback(vim.highlight.on_yank, {
    higroup = "Visual",
    on_visual = false,
  }),
})
