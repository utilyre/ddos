local neodim = require("neodim")
local lspconfig = require("lspconfig")
local completion = require("cmp_nvim_lsp")
local null = require("null-ls")
local navic = require("nvim-navic")
local illuminate = require("illuminate")

neodim.setup({
  blend_color = string.format("#%06x", vim.api.nvim_get_hl_by_name("Normal", true).background or 0),
  hide = {
    signs = false,
  },
})

vim.diagnostic.config({
  update_in_insert = true,
  virtual_text = false,
  float = {
    source = "always",
    border = "rounded",
    header = "",
    prefix = "",
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
  if not vim.fs.exists(config_path) then
    return {}
  end

  local config = vim.json.decode(vim.fs.read(config_path))
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
  if not vim.fs.exists(config_path) then
    return {}
  end

  local config = vim.json.decode(vim.fs.read(config_path))
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

    vim.keymap.set("n", "<leader>id", vim.fun_lambda(vim.lsp.buf.definition), { buffer = a.buf })
    vim.keymap.set("n", "<leader>ir", vim.fun_lambda(vim.lsp.buf.references), { buffer = a.buf })
    vim.keymap.set({ "n", "v" }, "<leader>ia", vim.fun_lambda(vim.lsp.buf.code_action), { buffer = a.buf })
    vim.keymap.set({ "n", "v" }, "<leader>if", vim.fun_lambda(vim.lsp.buf.format, { async = true }), { buffer = a.buf })
    vim.keymap.set("n", "<leader>ic", vim.fun_lambda(vim.lsp.buf.rename), { buffer = a.buf })
    vim.keymap.set("n", "<leader>ii", vim.fun_lambda(vim.lsp.buf.hover), { buffer = a.buf })
    vim.keymap.set("n", "<leader>iw", vim.fun_lambda(vim.diagnostic.open_float), { buffer = a.buf })
    vim.keymap.set("n", "<leader>ik", vim.fun_lambda(vim.diagnostic.goto_prev, { float = false }), { buffer = a.buf })
    vim.keymap.set("n", "<leader>ij", vim.fun_lambda(vim.diagnostic.goto_next, { float = false }), { buffer = a.buf })
  end,
})
