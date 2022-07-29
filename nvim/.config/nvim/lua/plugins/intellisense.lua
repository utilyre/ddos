local lines = require("lsp_lines")
local mason = require("mason-lspconfig")
local lspconfig = require("lspconfig")
local null = require("null-ls")
local dap = require("dap")
local scope = require("nvim-dap-virtual-text")
local navic = require("nvim-navic")
local illuminate = require("illuminate")

lines.setup()

vim.diagnostic.config({
  update_in_insert = true,
  virtual_text = false,
  float = { border = "rounded" },
  signs = {
    active = {
      vim.api.nvim_create_sign("DiagnosticSignError", _G.icons.diagnostic.Error),
      vim.api.nvim_create_sign("DiagnosticSignWarn", _G.icons.diagnostic.Warn),
      vim.api.nvim_create_sign("DiagnosticSignHint", _G.icons.diagnostic.Hint),
      vim.api.nvim_create_sign("DiagnosticSignInfo", _G.icons.diagnostic.Info),
    },
  },
})

local on_attach = function(client, bufnr)
  if client.server_capabilities.documentSymbolProvider then
    navic.attach(client, bufnr)
  end

  if client.server_capabilities.documentHighlightProvider then
    illuminate.on_attach(client, bufnr)
  end

  vim.keymap.set("n", "<leader>id", vim.get_hof(vim.lsp.buf.definition), { buffer = bufnr })
  vim.keymap.set("n", "<leader>ir", vim.get_hof(vim.lsp.buf.references), { buffer = bufnr })
  vim.keymap.set("n", "<leader>ia", vim.get_hof(vim.lsp.buf.code_action), { buffer = bufnr })
  vim.keymap.set("n", "<leader>if", vim.get_hof(vim.lsp.buf.format, { async = true }), { buffer = bufnr })
  vim.keymap.set("n", "<leader>ic", vim.get_hof(vim.lsp.buf.rename), { buffer = bufnr })
  vim.keymap.set("n", "<leader>ih", vim.get_hof(vim.lsp.buf.hover), { buffer = bufnr })
  vim.keymap.set("n", "<leader>il", vim.get_hof(vim.diagnostic.open_float), { buffer = bufnr })
  vim.keymap.set("n", "<leader>ik", vim.get_hof(vim.diagnostic.goto_prev), { buffer = bufnr })
  vim.keymap.set("n", "<leader>ij", vim.get_hof(vim.diagnostic.goto_next), { buffer = bufnr })
end

local get_servers = function()
  local config_path = os.getenv("MASON_CONFIG")
  if vim.fn.filereadable(config_path) == 0 then return {} end
  local config = vim.json.decode(table.concat(vim.fn.readfile(config_path), "\n"))

  local servers = {}
  for server, options in pairs(config.servers) do
    servers[server] = options.config
  end
  return servers
end

mason.setup({
  automatic_installation = true,
})

for server, options in pairs(get_servers()) do
  options.on_attach = on_attach
  lspconfig[server].setup(options)
end

vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
  border = "rounded",
})

local get_sources = function()
  local config_path = os.getenv("MASON_CONFIG")
  if vim.fn.filereadable(config_path) == 0 then return {} end
  local config = vim.json.decode(table.concat(vim.fn.readfile(config_path), "\n"))

  local sources = {}
  for source, options in pairs(config.sources) do
    for i, method in ipairs(options.methods) do
      table.insert(sources, null.builtins[method][source].with(options.config))
    end
  end
  return sources
end

null.setup({
  sources = get_sources(),
  on_attach = on_attach,
})

local get_adapters = function()
  local config_path = os.getenv("MASON_CONFIG")
  if vim.fn.filereadable(config_path) == 0 then return {} end
  local config = vim.json.decode(table.concat(vim.fn.readfile(config_path), "\n"))

  local adapters = {}
  for adapter, options in pairs(config.adapters) do
    adapters[adapter] = options.config
  end
  return adapters
end

for adapter, options in pairs(get_adapters()) do
  dap.adapters[adapter] = options
end

local get_languages = function()
  local config_path = os.getenv("MASON_CONFIG")
  if vim.fn.filereadable(config_path) == 0 then return {} end
  local config = vim.json.decode(table.concat(vim.fn.readfile(config_path), "\n"))

  local languages = {}
  for language, options in pairs(config.languages) do
    languages[language] = options.configs
  end
  return languages
end

for language, options in pairs(get_languages()) do
  dap.configurations[language] = options
end

vim.api.nvim_create_sign("DapStopped", _G.icons.debug.Stopped)
vim.api.nvim_create_sign("DapLogPoint", _G.icons.debug.Logpoint)
vim.api.nvim_create_sign("DapBreakpoint", _G.icons.debug.Breakpoint)
vim.api.nvim_create_sign("DapBreakpointCondition", _G.icons.debug.BreakpointCondition)
vim.api.nvim_create_sign("DapBreakpointRejected", _G.icons.debug.BreakpointRejected)

vim.keymap.set("n", "<leader>dr", vim.get_hof(dap.continue))
vim.keymap.set("n", "<leader>dx", vim.get_hof(dap.terminate))
vim.keymap.set("n", "<leader>dc", vim.get_hof(dap.repl.toggle))
vim.keymap.set("n", "<leader>db", vim.get_hof(dap.toggle_breakpoint))
vim.keymap.set("n", "<leader>dh", vim.get_hof(dap.step_out))
vim.keymap.set("n", "<leader>dl", vim.get_hof(dap.step_into))
vim.keymap.set("n", "<leader>dk", vim.get_hof(dap.step_back))
vim.keymap.set("n", "<leader>dj", vim.get_hof(dap.step_over))

scope.setup({
  commented = true,
})
