local spec = {
  "nvchad/nvim-colorizer.lua",
}

function spec.config()
  local colorizer = require("colorizer")

  colorizer.setup({
    filetypes = {},
    buftypes = { "" },
    user_default_options = {
      mode = "virtualtext",
      names = false,
      css = true,
    },
  })
end

return spec
