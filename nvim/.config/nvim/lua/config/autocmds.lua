local autocmds = vim.api.nvim_create_augroup("autocmds", {})

vim.api.nvim_create_autocmd("InsertLeave", {
  group = autocmds,
  callback = function()
    vim.opt.timeout = false
  end,
})

vim.api.nvim_create_autocmd("InsertEnter", {
  group = autocmds,
  callback = function()
    vim.opt.timeout = true
  end,
})

vim.api.nvim_create_autocmd("FileType", {
  group = autocmds,
  callback = function()
    vim.opt.formatoptions = {}
  end,
})

vim.api.nvim_create_autocmd("TextYankPost", {
  group = autocmds,
  callback = vim.callback(vim.highlight.on_yank, {
    higroup = "Visual",
    on_visual = false,
  }),
})
