local lines = require("lsp_lines")

lines.setup()

vim.diagnostic.config({
  virtual_text = false,
  virtual_lines = false,
  float = {
    scope = "cursor",
    source = "always",
    border = "rounded",
    header = "",
    prefix = "",
  },
  signs = {
    active = {
      "DiagnosticSignHint",
      "DiagnosticSignInfo",
      "DiagnosticSignWarn",
      "DiagnosticSignError",
    },
  },
})

vim.fn.sign_define("DiagnosticSignHint", {
  texthl = "DiagnosticSignHint",
  text = vim.g.icons.diagnostic.Suggestion,
})
vim.fn.sign_define("DiagnosticSignInfo", {
  texthl = "DiagnosticSignInfo",
  text = vim.g.icons.diagnostic.Information,
})
vim.fn.sign_define("DiagnosticSignWarn", {
  texthl = "DiagnosticSignWarn",
  text = vim.g.icons.diagnostic.Warning,
})
vim.fn.sign_define("DiagnosticSignError", {
  texthl = "DiagnosticSignError",
  text = vim.g.icons.diagnostic.Error,
})

vim.keymap.set("n", "<leader>dh", vim.callback(vim.diagnostic.open_float))
vim.keymap.set("n", "<leader>dl", vim.callback(lines.toggle))
vim.keymap.set("n", "<leader>dk", vim.callback(vim.diagnostic.goto_prev, { float = false }))
vim.keymap.set("n", "<leader>dj", vim.callback(vim.diagnostic.goto_next, { float = false }))
