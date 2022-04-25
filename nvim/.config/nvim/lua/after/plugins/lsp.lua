local config = require("lspconfig")
local installer = require("nvim-lsp-installer")
local luasnip = require("luasnip")

installer.on_server_ready(function(server)
  server:setup({
    capabilities = require("cmp_nvim_lsp").update_capabilities(vim.lsp.protocol.make_client_capabilities()),
    on_attach = function(client, buffnr)
      if client.resolved_capabilities.document_highlight then
        local gLspHighlight = vim.api.nvim_create_augroup("LspHighlight", { clear = false })
        vim.api.nvim_create_autocmd({ "CursorHold", "CursorHoldI" }, {
          buffer = buffnr,
          group = gLspHighlight,
          callback = vim.lsp.buf.document_highlight,
        })
        vim.api.nvim_create_autocmd({ "CursorMoved", "CursorMovedI" }, {
          buffer = buffnr,
          group = gLspHighlight,
          callback = vim.lsp.buf.clear_references,
        })
      end

      if client.resolved_capabilities.document_formatting then
        local gLspFormat = vim.api.nvim_create_augroup("LspFormat", { clear = false })
        vim.api.nvim_create_autocmd("BufWritePre", {
          buffer = buffnr,
          group = gLspFormat,
          callback = vim.lsp.buf.formatting_sync,
        })
      end

      local opts = { buffer = buffnr }
      vim.keymap.set("n", "<leader>ld", vim.lsp.buf.definition, opts)
      vim.keymap.set("n", "<leader>la", vim.lsp.buf.code_action, opts)
      vim.keymap.set("n", "<leader>lr", vim.lsp.buf.rename, opts)
      vim.keymap.set("n", "<leader>lh", vim.lsp.buf.hover, opts)
      vim.keymap.set("n", "<leader>ll", vim.diagnostic.open_float, opts)
      vim.keymap.set("n", "<leader>lk", vim.diagnostic.goto_prev, opts)
      vim.keymap.set("n", "<leader>lj", vim.diagnostic.goto_next, opts)
    end,
  })
end)

local signs = {
  { name = "DiagnosticSignError", text = " " },
  { name = "DiagnosticSignWarn", text = " " },
  { name = "DiagnosticSignHint", text = " " },
  { name = "DiagnosticSignInfo", text = " " },
}
for _, sign in ipairs(signs) do
  vim.fn.sign_define(sign.name, { texthl = sign.name, text = sign.text, numhl = "" })
end

vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, { border = "single" })
vim.diagnostic.config({
  virtual_text = false,
  signs = { active = signs },
  update_in_insert = true,
  severity_sort = true,
  float = {
    border = "single",
    source = "always",
    header = "",
    prefix = "",
  },
})

require("luasnip.loaders.from_vscode").lazy_load()
luasnip.config.setup({
  update_events = "TextChanged,TextChangedI",
  region_check_events = "CursorMoved,CursorMovedI",
})
