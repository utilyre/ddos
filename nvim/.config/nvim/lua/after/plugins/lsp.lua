local config = require("lspconfig")
local installer = require("nvim-lsp-installer")
local null = require("null-ls")
local cmp = require("cmp_nvim_lsp")
local whichkey = require("which-key")

local get_sources = function()
  local config_path = vim.fn.expand("$NULL_CONFIG")
  if vim.fn.filereadable(config_path) == 0 then return {} end

  local sources = {}
  for _, line in pairs(vim.fn.readfile(config_path)) do
    line = line:gsub("%s*#.*$", "")
    if not vim.str_isempty(line) then
      local parts = vim.split(line, "->")
      table.insert(sources, null.builtins[parts[2]][parts[1]])
    end
  end

  return sources
end

local on_attach = function(client, buffnr)
  local gLsp = vim.api.nvim_create_augroup("Lsp", { clear = false })

  if client.server_capabilities.documentHighlightProvider then
    vim.api.nvim_create_autocmd({ "CursorHold", "CursorHoldI" }, {
      group = gLsp,
      buffer = buffnr,
      callback = vim.lsp.buf.document_highlight,
    })
    vim.api.nvim_create_autocmd({ "CursorMoved", "CursorMovedI" }, {
      group = gLsp,
      buffer = buffnr,
      callback = vim.lsp.buf.clear_references,
    })
  end

  whichkey.register({
    i = {
      name = "Intellisense",
      d = { vim.api.nvim_create_hof(vim.lsp.buf.definition), "Definition" },
      a = { vim.api.nvim_create_hof(vim.lsp.buf.code_action), "Actions" },
      f = { vim.api.nvim_create_hof(vim.lsp.buf.format, { async = true }), "Format" },
      c = { vim.api.nvim_create_hof(vim.lsp.buf.rename), "Change" },
      h = { vim.api.nvim_create_hof(vim.lsp.buf.hover), "Hover" },
      l = { vim.api.nvim_create_hof(vim.diagnostic.open_float), "Diagnostics" },
      k = { vim.api.nvim_create_hof(vim.diagnostic.goto_prev), "Previous" },
      j = { vim.api.nvim_create_hof(vim.diagnostic.goto_next), "Next" },
    },
  }, { prefix = "<leader>", buffer = buffnr })
end

vim.diagnostic.config({
  update_in_insert = true,
  virtual_text = false,
  float = { border = "rounded" },
  signs = {
    active = {
      vim.api.nvim_create_sign("DiagnosticSignError", vim.g.symbols.diagnostic.Error),
      vim.api.nvim_create_sign("DiagnosticSignWarn", vim.g.symbols.diagnostic.Warn),
      vim.api.nvim_create_sign("DiagnosticSignHint", vim.g.symbols.diagnostic.Hint),
      vim.api.nvim_create_sign("DiagnosticSignInfo", vim.g.symbols.diagnostic.Info),
    },
  },
})
vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
  border = "rounded",
})

installer.on_server_ready(function(server)
  server:setup({
    capabilities = cmp.update_capabilities(vim.lsp.protocol.make_client_capabilities()),
    on_attach = on_attach,
  })
end)

null.setup({
  on_attach = on_attach,
  sources = get_sources(),
})
