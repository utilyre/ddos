local spec = {
  "nvchad/nvim-colorizer.lua",
}

function spec.config()
  local colorizer = require("colorizer")

  colorizer.setup({
    user_default_options = {
      mode = "virtualtext",
      css = true,
    },
  })
end

return spec
