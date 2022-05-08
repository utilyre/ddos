local installer = require("nvim-lsp-installer")
local luasnip = require("luasnip")
local cmp = require("cmp_nvim_lsp")
local whichkey = require("which-key")

require("lspconfig")
require("luasnip.loaders.from_vscode").lazy_load()

installer.on_server_ready(function(server)
  server:setup({
    capabilities = cmp.update_capabilities(vim.lsp.protocol.make_client_capabilities()),
    on_attach = function(client, buffnr)
      if client.resolved_capabilities.document_highlight then
        local gLspHighlight = vim.api.nvim_create_augroup("LspHighlight", { clear = false })
        vim.api.nvim_create_autocmd({ "CursorHold", "CursorHoldI" }, {
          group = gLspHighlight,
          buffer = buffnr,
          callback = vim.lsp.buf.document_highlight,
        })
        vim.api.nvim_create_autocmd({ "CursorMoved", "CursorMovedI" }, {
          group = gLspHighlight,
          buffer = buffnr,
          callback = vim.lsp.buf.clear_references,
        })
      end

      if client.resolved_capabilities.document_formatting then
        local gLspFormat = vim.api.nvim_create_augroup("LspFormat", { clear = false })
        vim.api.nvim_create_autocmd("BufWritePre", {
          group = gLspFormat,
          buffer = buffnr,
          callback = vim.lsp.buf.formatting_sync,
        })
      end

      whichkey.register({
        i = {
          name = "Intellisense",
          d = { vim.lsp.buf.definition, "Definition" },
          r = { vim.lsp.buf.references, "References" },
          a = { vim.lsp.buf.code_action, "Actions" },
          c = { vim.lsp.buf.rename, "Rename" },
          h = { vim.lsp.buf.hover, "Hover" },
          l = { vim.diagnostic.open_float, "Diagnostics" },
          k = { vim.diagnostic.goto_prev, "Previous" },
          j = { vim.diagnostic.goto_next, "Next" },
        },
      }, { prefix = "<leader>", buffer = buffnr })
    end,
  })
end)

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

vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, { border = "single" })
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

luasnip.config.setup({
  update_events = "TextChanged,TextChangedI",
  region_check_events = "CursorMoved,CursorMovedI",
})
