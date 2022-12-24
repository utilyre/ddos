local spec = {
  "declancm/cinnamon.nvim",
}

function spec.config()
  local cinnamon = require("cinnamon")

  cinnamon.setup({
    default_keymaps = true,
    extra_keymaps = true,
    extended_keymaps = true,
    scroll_limit = 64,
  })
end

return spec
