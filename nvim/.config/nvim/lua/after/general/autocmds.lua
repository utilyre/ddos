local gAutocmds = vim.api.nvim_create_augroup("Autocmds", {})

vim.api.nvim_create_autocmd("BufEnter", {
  group = gAutocmds,
  command = "set formatoptions-=cro",
})

vim.api.nvim_create_autocmd("TextYankPost", {
  group = gAutocmds,
  callback = function() vim.highlight.on_yank({ higroup = "Visual", on_visual = false }) end,
})

vim.api.nvim_create_autocmd("InsertEnter", {
  group = gAutocmds,
  callback = function() vim.opt.timeout = true end,
})
vim.api.nvim_create_autocmd("InsertLeave", {
  group = gAutocmds,
  callback = function() vim.opt.timeout = false end,
})
