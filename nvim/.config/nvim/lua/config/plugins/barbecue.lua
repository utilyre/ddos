local spec = {
  "utilyre/barbecue.nvim",
  dependencies = {
    "smiteshp/nvim-navic",
    "nvim-tree/nvim-web-devicons",
  },
}

function spec.config()
  local barbecue = require("barbecue")
  local ui = require("barbecue.ui")

  barbecue.setup({
    create_autocmd = false,
    kinds = vim.g.icons.kind,
    symbols = {
      ellipsis = vim.g.icons.layout.Ellipsis,
      separator = vim.g.icons.layout.Chevron,
    },
  })

  vim.api.nvim_create_autocmd({ "WinScrolled", "BufWinEnter", "CursorHold", "InsertLeave" }, {
    group = vim.api.nvim_create_augroup("barbecue", {}),
    callback = vim.callback(ui.update),
  })
end

return spec
