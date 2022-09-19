local lines = require("lsp_lines")
local lspconfig = require("lspconfig")
local completion = require("cmp_nvim_lsp")
local null = require("null-ls")
local navic = require("nvim-navic")
local illuminate = require("illuminate")

lines.setup()

vim.diagnostic.config({
  update_in_insert = true,
  virtual_text = false,
  virtual_lines = {
    only_current_line = true,
  },
  signs = {
    active = {
      vim.api.nvim_create_sign("DiagnosticSignHint", _G.icons.diagnostic.Suggestion),
      vim.api.nvim_create_sign("DiagnosticSignInfo", _G.icons.diagnostic.Information),
      vim.api.nvim_create_sign("DiagnosticSignWarn", _G.icons.diagnostic.Warning),
      vim.api.nvim_create_sign("DiagnosticSignError", _G.icons.diagnostic.Error),
    },
  },
})

local get_servers = function()
  local config_path = os.getenv("MASON_CONFIG")
  if vim.fn.filereadable(config_path) == 0 then
    return {}
  end

  local config = vim.json.decode(table.concat(vim.fn.readfile(config_path), "\n"))
  local servers = {}

  for server, options in pairs(config.servers or {}) do
    options.capabilities = completion.update_capabilities(vim.lsp.protocol.make_client_capabilities())
    servers[server] = options
  end

  return servers
end

for server, config in pairs(get_servers()) do
  lspconfig[server].setup(config)
end

vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
  border = "rounded",
})

local get_sources = function()
  local config_path = os.getenv("MASON_CONFIG")
  if vim.fn.filereadable(config_path) == 0 then
    return {}
  end

  local config = vim.json.decode(table.concat(vim.fn.readfile(config_path), "\n"))
  local sources = {}

  for linter, options in pairs(config.linters or {}) do
    table.insert(sources, null.builtins.diagnostics[linter].with(options))
    table.insert(sources, null.builtins.code_actions[linter].with(options))
  end
  for formatter, options in pairs(config.formatters or {}) do
    table.insert(sources, null.builtins.formatting[formatter].with(options))
  end

  return sources
end

null.setup({
  sources = get_sources(),
})

illuminate.configure({
  providers = { "lsp" },
})

vim.api.nvim_create_augroup("lsp", {})
vim.api.nvim_create_autocmd("LspAttach", {
  group = "lsp",
  callback = function(a)
    local client = vim.lsp.get_client_by_id(a.data.client_id)

    if client.server_capabilities.documentSymbolProvider then
      navic.attach(client, a.buf)
    end

    if client.server_capabilities.documentHighlightProvider then
      illuminate.on_attach(client, a.buf)
    end

    vim.keymap.set("n", "<leader>id", vim.get_hof(vim.lsp.buf.definition), { buffer = a.buf })
    vim.keymap.set("n", "<leader>ir", vim.get_hof(vim.lsp.buf.references), { buffer = a.buf })
    vim.keymap.set("n", "<leader>ia", vim.get_hof(vim.lsp.buf.code_action), { buffer = a.buf })
    vim.keymap.set("n", "<leader>if", vim.get_hof(vim.lsp.buf.format, { async = true }), { buffer = a.buf })
    vim.keymap.set("n", "<leader>ic", vim.get_hof(vim.lsp.buf.rename), { buffer = a.buf })
    vim.keymap.set("n", "<leader>ii", vim.get_hof(vim.lsp.buf.hover), { buffer = a.buf })
    vim.keymap.set("n", "<leader>ik", vim.get_hof(vim.diagnostic.goto_prev, { float = false }), { buffer = a.buf })
    vim.keymap.set("n", "<leader>ij", vim.get_hof(vim.diagnostic.goto_next, { float = false }), { buffer = a.buf })
  end;
})
