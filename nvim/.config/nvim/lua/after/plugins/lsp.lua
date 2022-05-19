local config = require("lspconfig")
local installer = require("nvim-lsp-installer")
local null = require("null-ls")
local cmp = require("cmp_nvim_lsp")
local whichkey = require("which-key")

local get_signs = function()
  local signs = {
    { name = "DiagnosticSignError", text = "" },
    { name = "DiagnosticSignWarn", text = "" },
    { name = "DiagnosticSignHint", text = "" },
    { name = "DiagnosticSignInfo", text = "" },
  }

  for _, sign in ipairs(signs) do
    vim.fn.sign_define(sign.name, {
      texthl = sign.name,
      text = sign.text,
    })
  end

  return signs
end

local on_attach = function(client, buffnr)
  local gLsp = vim.api.nvim_create_augroup("Lsp", { clear = false })

  if client.resolved_capabilities.document_highlight then
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

  if client.resolved_capabilities.code_lens then
    vim.api.nvim_create_autocmd({ "CursorHold", "CursorHoldI" }, {
      group = gLsp,
      buffer = buffnr,
      callback = vim.lsp.codelens.refresh,
    })
  end

  whichkey.register({
    i = {
      name = "Intellisense",
      d = { vim.lsp.buf.definition, "Definition" },
      a = { vim.lsp.buf.code_action, "Actions" },
      f = { vim.lsp.buf.formatting, "Format" },
      c = { vim.lsp.buf.rename, "Rename" },
      h = { vim.lsp.buf.hover, "Hover" },
      l = { vim.diagnostic.open_float, "Diagnostics" },
      k = { vim.diagnostic.goto_prev, "Previous" },
      j = { vim.diagnostic.goto_next, "Next" },
    },
  }, { prefix = "<leader>", buffer = buffnr })
end

local get_sources = function()
  local config_path = vim.fn.expand("~/.null-ls")
  if vim.fn.filereadable(config_path) == 0 then return {} end

  local sources = {}
  for _, line in pairs(vim.fn.readfile(config_path)) do
    local parts = vim.split(line, ".", { plain = true })
    table.insert(sources, null.builtins[parts[1]][parts[2]])
  end

  return sources
end

vim.diagnostic.config({
  update_in_insert = true,
  virtual_text = false,
  signs = {
    active = get_signs(),
  },
  float = {
    border = "single",
  },
})
vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
  border = "single",
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
