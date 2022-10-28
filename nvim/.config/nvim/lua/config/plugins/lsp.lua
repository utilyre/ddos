local lspconfig = require("lspconfig")
local navic = require("nvim-navic")
local illuminate = require("illuminate")
local cmp = require("cmp_nvim_lsp")

for server, options in pairs(vim.g.servers or {}) do
  options.capabilities = cmp.default_capabilities()
  options.handlers = {
    ["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
      border = "rounded",
    }),
    ["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, {
      border = "rounded",
    }),
  }

  lspconfig[server].setup(options)
end

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
      vim.api.nvim_create_sign("DiagnosticSignHint", vim.g.icons.diagnostic.Suggestion),
      vim.api.nvim_create_sign("DiagnosticSignInfo", vim.g.icons.diagnostic.Information),
      vim.api.nvim_create_sign("DiagnosticSignWarn", vim.g.icons.diagnostic.Warning),
      vim.api.nvim_create_sign("DiagnosticSignError", vim.g.icons.diagnostic.Error),
    },
  },
})

illuminate.configure({
  providers = { "lsp" },
})

vim.api.nvim_create_augroup("lsp", {})
vim.api.nvim_create_autocmd("LspAttach", {
  group = "lsp",
  callback = function(a)
    local client = vim.lsp.get_client_by_id(a.data.client_id)

    if client.server_capabilities["documentSymbolProvider"] then
      navic.attach(client, a.buf)
    end
    if client.server_capabilities["documentHighlightProvider"] then
      illuminate.on_attach(client, a.buf)
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
