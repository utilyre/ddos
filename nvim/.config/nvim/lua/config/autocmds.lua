local augroup = vim.api.nvim_create_augroup("autocmds", {})

vim.api.nvim_create_autocmd("InsertLeave", {
  group = augroup,
  callback = function()
    vim.opt.timeout = false
  end,
})

vim.api.nvim_create_autocmd("InsertEnter", {
  group = augroup,
  callback = function()
    vim.opt.timeout = true
  end,
})

vim.api.nvim_create_autocmd("BufWinEnter", {
  group = augroup,
  callback = function()
    vim.opt.formatoptions = {
      t = true,
      c = true,
      r = true,
      q = true,
      n = true,
      m = true,
      j = true,
    }
  end,
})

vim.api.nvim_create_autocmd("TextYankPost", {
  group = augroup,
  callback = vim.callback(vim.highlight.on_yank, {
    higroup = "Visual",
    on_visual = false,
  }),
})
