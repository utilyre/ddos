local lspconfig = require("lspconfig")
local mason = require("mason-lspconfig")
local null = require("null-ls")
local dap = require("dap")
local scope = require("nvim-dap-virtual-text")
local navic = require("nvim-navic")

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

vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
  border = "rounded",
})

local on_attach = function(client, bufnr)
  if client.server_capabilities.documentHighlightProvider then
    vim.api.nvim_create_augroup("lsp", { clear = false })
    vim.api.nvim_create_autocmd({ "CursorHold", "CursorHoldI" }, {
      group = "lsp",
      buffer = bufnr,
      callback = vim.get_hof(vim.lsp.buf.document_highlight),
    })
    vim.api.nvim_create_autocmd({ "CursorMoved", "CursorMovedI" }, {
      group = "lsp",
      buffer = bufnr,
      callback = vim.get_hof(vim.lsp.buf.clear_references),
    })
  end

  if client.server_capabilities.documentSymbolProvider then
    navic.attach(client, bufnr)
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

mason.setup({
  automatic_installation = true,
})

local get_servers = function()
  local config_path = os.getenv("MASON_CONFIG")
  if vim.fn.filereadable(config_path) == 0 then return {} end
  local config = vim.json.decode(table.concat(vim.fn.readfile(config_path), "\n"))

  local servers = {}
  for server, options in pairs(config.servers) do
    setmetatable(options, nil)
    servers[server] = options
  end
  return servers
end

for server, options in pairs(get_servers()) do
  options.on_attach = on_attach
  lspconfig[server].setup(options)
end

local get_sources = function()
  local config_path = os.getenv("MASON_CONFIG")
  if vim.fn.filereadable(config_path) == 0 then return {} end
  local config = vim.json.decode(table.concat(vim.fn.readfile(config_path), "\n"))

  local sources = {}
  for source, options in pairs(config.sources) do
    for i, method in ipairs(options.methods) do
      options.methods = nil
      table.insert(sources, null.builtins[method][source].with(options))
    end
  end
  return sources
end

null.setup({
  sources = get_sources(),
  on_attach = on_attach,
})

local get_debuggers = function()
  local config_path = os.getenv("MASON_CONFIG")
  if vim.fn.filereadable(config_path) == 0 then return {} end
  local config = vim.json.decode(table.concat(vim.fn.readfile(config_path), "\n"))

  local debuggers = {}
  for debugger, options in pairs(config.debuggers) do
    setmetatable(options, nil)
    debuggers[debugger] = options
  end
  return debuggers
end

for debugger, options in pairs(get_debuggers()) do
  dap.adapters[debugger] = options.config
  for language, config in pairs(options) do
    if language ~= "config" then dap.configurations[language] = config end
  end
end

vim.api.nvim_create_sign("DapStopped", _G.icons.debug.Stopped)
vim.api.nvim_create_sign("DapLogPoint", _G.icons.debug.Logpoint)
vim.api.nvim_create_sign("DapBreakpoint", _G.icons.debug.Breakpoint)
vim.api.nvim_create_sign("DapBreakpointCondition", _G.icons.debug.BreakpointCondition)
vim.api.nvim_create_sign("DapBreakpointRejected", _G.icons.debug.BreakpointRejected)

scope.setup({
  commented = true,
})

vim.keymap.set("n", "<leader>dr", vim.get_hof(dap.continue))
vim.keymap.set("n", "<leader>dx", vim.get_hof(dap.terminate))
vim.keymap.set("n", "<leader>dc", vim.get_hof(dap.repl.toggle))
vim.keymap.set("n", "<leader>db", vim.get_hof(dap.toggle_breakpoint))
vim.keymap.set("n", "<leader>dh", vim.get_hof(dap.step_out))
vim.keymap.set("n", "<leader>dl", vim.get_hof(dap.step_into))
vim.keymap.set("n", "<leader>dk", vim.get_hof(dap.step_back))
vim.keymap.set("n", "<leader>dj", vim.get_hof(dap.step_over))
