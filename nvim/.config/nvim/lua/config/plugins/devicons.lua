local spec = {
  "kyazdani42/nvim-web-devicons",
}

function spec.config()
  local devicons = require("nvim-web-devicons")

  devicons.setup({
    default = true,
  })
end

return spec
