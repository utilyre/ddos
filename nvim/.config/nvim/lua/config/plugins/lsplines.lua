local spec = {
  "https://git.sr.ht/~whynothugo/lsp_lines.nvim",
}

function spec.config()
  local lines = require("lsp_lines")

  lines.setup()

  vim.diagnostic.config({
    virtual_text = true,
    virtual_lines = false,
    update_in_insert = true,
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

  vim.fn.sign_define("DiagnosticSignHint", { numhl = "DiagnosticSignHint" })
  vim.fn.sign_define("DiagnosticSignInfo", { numhl = "DiagnosticSignInfo" })
  vim.fn.sign_define("DiagnosticSignWarn", { numhl = "DiagnosticSignWarn" })
  vim.fn.sign_define("DiagnosticSignError", { numhl = "DiagnosticSignError" })

  vim.keymap.set("n", "<leader>dd", function()
    vim.diagnostic.config({
      virtual_text = not vim.diagnostic.config().virtual_text,
      virtual_lines = not vim.diagnostic.config().virtual_lines,
    })
  end)
  vim.keymap.set("n", "<leader>dh", vim.callback(vim.diagnostic.open_float))
  vim.keymap.set("n", "<leader>dk", vim.callback(vim.diagnostic.goto_prev, { float = false }))
  vim.keymap.set("n", "<leader>dj", vim.callback(vim.diagnostic.goto_next, { float = false }))
end

return spec
