local spec = {
  "rrethy/vim-illuminate",
  dependencies = {
    { "nvim-treesitter/nvim-treesitter" },
    { "neovim/nvim-lspconfig" },
  },
}

function spec.config()
  local illuminate = require("illuminate")

  illuminate.configure({
    modes_allowlist = { "n", "i" },
    providers = { "lsp", "treesitter" },
  })
end

return spec
