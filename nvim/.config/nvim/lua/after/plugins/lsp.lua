local config = require("lspconfig")
local installer = require("nvim-lsp-installer")
local null = require("null-ls")
local cmp = require("cmp_nvim_lsp")
local whichkey = require("which-key")

local get_signs = function()
  local signs = {
    { name = "DiagnosticSignError", text = vim.g.symbols.diagnostic.Error },
    { name = "DiagnosticSignWarn", text = vim.g.symbols.diagnostic.Warn },
    { name = "DiagnosticSignHint", text = vim.g.symbols.diagnostic.Hint },
    { name = "DiagnosticSignInfo", text = vim.g.symbols.diagnostic.Info },
  }

  for _, sign in ipairs(signs) do
    vim.fn.sign_define(sign.name, {
      texthl = sign.name,
      text = sign.text,
    })
  end

  return signs
end

local get_sources = function()
  local config_path = vim.fn.expand("$NVIM_NULL")
  if vim.fn.filereadable(config_path) == 0 then return {} end

  local sources = {}
  for _, line in pairs(vim.fn.readfile(config_path)) do
    local parts = vim.split(line, "#")
    table.insert(sources, null.builtins[parts[2]][parts[1]])
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
      d = { vim.fun_create_hof(vim.lsp.buf.definition), "Definition" },
      a = { vim.fun_create_hof(vim.lsp.buf.code_action), "Actions" },
      f = { vim.fun_create_hof(vim.lsp.buf.format, { async = true }), "Format" },
      c = { vim.fun_create_hof(vim.lsp.buf.rename), "Change" },
      h = { vim.fun_create_hof(vim.lsp.buf.hover), "Hover" },
      l = { vim.fun_create_hof(vim.diagnostic.open_float), "Diagnostics" },
      k = { vim.fun_create_hof(vim.diagnostic.goto_prev), "Previous" },
      j = { vim.fun_create_hof(vim.diagnostic.goto_next), "Next" },
    },
  }, { prefix = "<leader>", buffer = buffnr })
end

vim.diagnostic.config({
  update_in_insert = true,
  virtual_text = false,
  signs = { active = get_signs() },
  float = { border = "rounded" },
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
