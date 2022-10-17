local lspconfig = require("lspconfig")
local navic = require("nvim-navic")
local illuminate = require("illuminate")
local cmp = require("cmp_nvim_lsp")

local config = vim.json.decode(vim.fs.read(os.getenv("MASON_CONFIG")) or "{}")

for server, options in pairs(config.servers or {}) do
  options.capabilities = cmp.update_capabilities(vim.lsp.protocol.make_client_capabilities())
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

    vim.keymap.set("n", "<leader>id", vim.fun_lambda(vim.lsp.buf.definition, { reuse_win = true }), { buffer = a.buf })
    vim.keymap.set("n", "<leader>it", vim.fun_lambda(vim.lsp.buf.type_definition, { reuse_win = true }), { buffer = a.buf })
    vim.keymap.set("n", "<leader>ii", vim.fun_lambda(vim.lsp.buf.implementation), { buffer = a.buf })
    vim.keymap.set("n", "<leader>ir", vim.fun_lambda(vim.lsp.buf.references), { buffer = a.buf })
    vim.keymap.set("n", "<leader>ia", vim.fun_lambda(vim.lsp.buf.code_action), { buffer = a.buf })
    vim.keymap.set("n", "<leader>if", vim.fun_lambda(vim.lsp.buf.format, { async = true }), { buffer = a.buf })
    vim.keymap.set("n", "<leader>ic", vim.fun_lambda(vim.lsp.buf.rename), { buffer = a.buf })
    vim.keymap.set("n", "<leader>ih", vim.fun_lambda(vim.lsp.buf.hover), { buffer = a.buf })
    vim.keymap.set("n", "<leader>is", vim.fun_lambda(vim.lsp.buf.signature_help), { buffer = a.buf })
    vim.keymap.set("n", "<leader>io", vim.fun_lambda(vim.diagnostic.open_float), { buffer = a.buf })
    vim.keymap.set("n", "<leader>ik", vim.fun_lambda(vim.diagnostic.goto_prev, { float = false }), { buffer = a.buf })
    vim.keymap.set("n", "<leader>ij", vim.fun_lambda(vim.diagnostic.goto_next, { float = false }), { buffer = a.buf })
  end,
})
