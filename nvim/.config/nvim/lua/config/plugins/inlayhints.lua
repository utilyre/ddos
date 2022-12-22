local spec = {
  "lvimuser/lsp-inlayhints.nvim",
  dependencies = {
    { "neovim/nvim-lspconfig" },
  },
}

function spec.config()
  local inlayhints = require("lsp-inlayhints")

  inlayhints.setup()

  vim.api.nvim_create_augroup("inlayhints", {})
  vim.api.nvim_create_autocmd("LspAttach", {
    group = "inlayhints",
    callback = function(a)
      local client = vim.lsp.get_client_by_id(a.data.client_id)
      if client.server_capabilities["inlayHintProvider"] then inlayhints.on_attach(client, a.buf) end
    end,
  })
end

return spec
