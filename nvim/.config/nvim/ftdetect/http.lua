local FileHttp = vim.api.nvim_create_augroup("FileHttp", { clear = false })
vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
  group = FileHttp,
  pattern = "*.http",
  callback = function() vim.opt_local.filetype = "http" end,
})
