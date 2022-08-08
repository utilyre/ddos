vim.api.nvim_create_augroup("fthttp", {})
vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
  group = "fthttp",
  pattern = "*.http",
  callback = function(a)
    vim.bo[a.buf].filetype = "http"
    vim.bo[a.buf].commentstring = "#%s"
  end,
})
