local lines = require("lsp_lines")
local mason = require("mason-lspconfig")
local lspconfig = require("lspconfig")
local null = require("null-ls")
local navic = require("nvim-navic")

lines.setup()

vim.diagnostic.config({
  update_in_insert = true,
  virtual_text = false,
  virtual_lines = {
    only_current_line = true,
  },
  signs = {
    active = {
      vim.api.nvim_create_sign("DiagnosticSignError", _G.icons.diagnostic.Error),
      vim.api.nvim_create_sign("DiagnosticSignWarn", _G.icons.diagnostic.Warn),
      vim.api.nvim_create_sign("DiagnosticSignHint", _G.icons.diagnostic.Hint),
      vim.api.nvim_create_sign("DiagnosticSignInfo", _G.icons.diagnostic.Info),
    },
  },
})

local attach = function(client, bufnr)
  if client.server_capabilities.documentSymbolProvider then
    navic.attach(client, bufnr)
  end

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

  vim.keymap.set("n", "<leader>id", vim.get_hof(vim.lsp.buf.definition), { buffer = bufnr })
  vim.keymap.set("n", "<leader>ir", vim.get_hof(vim.lsp.buf.references), { buffer = bufnr })
  vim.keymap.set("n", "<leader>ia", vim.get_hof(vim.lsp.buf.code_action), { buffer = bufnr })
  vim.keymap.set("n", "<leader>if", vim.get_hof(vim.lsp.buf.format, { async = true }), { buffer = bufnr })
  vim.keymap.set("n", "<leader>ic", vim.get_hof(vim.lsp.buf.rename), { buffer = bufnr })
  vim.keymap.set("n", "<leader>ii", vim.get_hof(vim.lsp.buf.hover), { buffer = bufnr })
  vim.keymap.set("n", "<leader>ik", vim.get_hof(vim.diagnostic.goto_prev, { float = false }), { buffer = bufnr })
  vim.keymap.set("n", "<leader>ij", vim.get_hof(vim.diagnostic.goto_next, { float = false }), { buffer = bufnr })
end

local get_servers = function()
  local config_path = os.getenv("MASON_CONFIG")
  if vim.fn.filereadable(config_path) == 0 then return {} end
  local config = vim.json.decode(table.concat(vim.fn.readfile(config_path), "\n"))

  local servers = {}
  for server, options in pairs(config.servers) do
    options.config.on_attach = function(client, bufnr)
      attach(client, bufnr)

      for capability, enabled in pairs(options.capabilities) do
        client.server_capabilities[capability] = enabled
      end
    end

    servers[server] = options.config
  end
  return servers
end

mason.setup({
  automatic_installation = true,
})

for server, config in pairs(get_servers()) do
  lspconfig[server].setup(config)
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
  on_attach = function(client, bufnr)
    attach(client, bufnr)
  end,
})
