local FileTypeDetect = vim.api.nvim_create_augroup("FileTypeDetect", { clear = false })

vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
  group = FileTypeDetect,
  pattern = "*.http",
  callback = function() vim.opt_local.filetype = "http" end,
})
