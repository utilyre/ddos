local lspconfig = require("lspconfig")
local cmp = require("cmp_nvim_lsp")

for server, options in pairs(vim.g.servers or {}) do
  options.capabilities = cmp.default_capabilities()
  lspconfig[server].setup(options)
end

vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
  border = "rounded",
})

vim.diagnostic.config({
  virtual_text = false,
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

vim.api.nvim_create_augroup("lsp", {})
vim.api.nvim_create_autocmd("LspAttach", {
  group = "lsp",
  callback = function(a)
    local client = vim.lsp.get_client_by_id(a.data.client_id)

    if client.server_capabilities["codeLensProvider"] then
      vim.api.nvim_create_augroup("codelens", { clear = false })
      vim.api.nvim_create_autocmd({ "CursorHold", "TextChanged", "InsertLeave" }, {
        group = "codelens",
        buffer = a.buf,
        callback = vim.callback(vim.lsp.codelens.refresh),
      })
    end

    vim.keymap.set("n", "<leader>id", vim.callback(vim.lsp.buf.definition, { reuse_win = true }), { buffer = a.buf })
    vim.keymap.set("n", "<leader>it", vim.callback(vim.lsp.buf.type_definition, { reuse_win = true }), { buffer = a.buf })
    vim.keymap.set("n", "<leader>ii", vim.callback(vim.lsp.buf.implementation), { buffer = a.buf })
    vim.keymap.set("n", "<leader>ir", vim.callback(vim.lsp.buf.references), { buffer = a.buf })
    vim.keymap.set("n", "<leader>ia", vim.callback(vim.lsp.buf.code_action), { buffer = a.buf })
    vim.keymap.set("n", "<leader>if", vim.callback(vim.lsp.buf.format, { async = true }), { buffer = a.buf })
    vim.keymap.set("n", "<leader>ic", vim.callback(vim.lsp.buf.rename), { buffer = a.buf })
    vim.keymap.set("n", "<leader>ih", vim.callback(vim.lsp.buf.hover), { buffer = a.buf })
    vim.keymap.set("n", "<leader>io", vim.callback(vim.diagnostic.open_float), { buffer = a.buf })
    vim.keymap.set("n", "<leader>ik", vim.callback(vim.diagnostic.goto_prev, { float = false }), { buffer = a.buf })
    vim.keymap.set("n", "<leader>ij", vim.callback(vim.diagnostic.goto_next, { float = false }), { buffer = a.buf })
  end,
})
