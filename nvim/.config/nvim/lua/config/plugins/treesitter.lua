local spec = {
  "nvim-treesitter/nvim-treesitter",
  dependencies = {
    "p00f/nvim-ts-rainbow",
  },
}

function spec.config()
  local treesitter = require("nvim-treesitter.configs")

  treesitter.setup({
    highlight = {
      enable = true,
    },
    indent = {
      enable = true,
    },
    rainbow = {
      enable = true,
    },
  })
end

return spec
