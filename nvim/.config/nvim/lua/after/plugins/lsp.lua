local config = require("lspconfig")
local installer = require("nvim-lsp-installer")
local null = require("null-ls")
local cmp = require("cmp_nvim_lsp")
local whichkey = require("which-key")

local signs = {
  { name = "DiagnosticSignError", text = "" },
  { name = "DiagnosticSignWarn", text = "" },
  { name = "DiagnosticSignHint", text = "" },
  { name = "DiagnosticSignInfo", text = "" },
}

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

  vim.keymap.set("i", "<c-j>", vim.lsp.buf.signature_help)
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

for _, sign in ipairs(signs) do
  vim.fn.sign_define(sign.name, {
    texthl = sign.name,
    text = sign.text,
  })
end
vim.diagnostic.config({
  update_in_insert = true,
  virtual_text = false,
  signs = {
    active = signs,
  },
  float = {
    border = "single",
  },
})
vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
  border = "single",
})
vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, {
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
  sources = {
    null.builtins.diagnostics.shellcheck,
    null.builtins.diagnostics.luacheck,
    null.builtins.formatting.stylua,
    null.builtins.formatting.prettier.with({
      prefer_local = "node_modules/.bin",
    }),
  },
})
