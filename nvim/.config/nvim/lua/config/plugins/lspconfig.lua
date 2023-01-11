local spec = {
  "neovim/nvim-lspconfig",
  dependencies = {
    "hrsh7th/cmp-nvim-lsp",
  },
}

function spec.config()
  local lspconfig = require("lspconfig")
  local cmp = require("cmp_nvim_lsp")

  local servers_path = vim.fn.stdpath("config") .. "/user/servers.lua"
  if vim.loop.fs_access(servers_path, "R") then
    lspconfig.util.on_setup = lspconfig.util.add_hook_after(
      lspconfig.util.on_setup,
      function(config)
        config.capabilities = vim.tbl_deep_extend(
          "force",
          config.capabilities,
          cmp.default_capabilities()
        )
      end
    )

    dofile(servers_path)
  end

  vim.api.nvim_create_autocmd("LspAttach", {
    group = vim.api.nvim_create_augroup("lsp", {}),
    callback = function(a)
      local client = vim.lsp.get_client_by_id(a.data.client_id)

      if client.server_capabilities["codeLensProvider"] then
        vim.api.nvim_create_autocmd({
          "CursorHold",
          "TextChanged",
          "InsertLeave",
        }, {
          group = vim.api.nvim_create_augroup("codelens", { clear = false }),
          buffer = a.buf,
          callback = vim.callback(vim.lsp.codelens.refresh),
        })
      end

      local function map(left, right)
        vim.keymap.set("n", "<leader>i" .. left, right, { buffer = a.buf })
      end

      map("s", vim.callback(vim.lsp.buf.document_symbol))
      map("d", vim.callback(vim.lsp.buf.definition, { reuse_win = true }))
      map("t", vim.callback(vim.lsp.buf.type_definition, { reuse_win = true }))
      map("i", vim.callback(vim.lsp.buf.implementation))
      map("r", vim.callback(vim.lsp.buf.references))
      map("a", vim.callback(vim.lsp.buf.code_action))
      map("f", vim.callback(vim.lsp.buf.format, { async = true }))
      map("c", vim.callback(vim.lsp.buf.rename))
      map("h", vim.callback(vim.lsp.buf.hover))
    end,
  })
end

return spec
