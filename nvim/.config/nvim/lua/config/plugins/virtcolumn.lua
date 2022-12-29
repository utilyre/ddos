local spec = {
  "lukas-reineke/virt-column.nvim",
}

function spec.config()
  local virtcolumn = require("virt-column")

  virtcolumn.setup({
    virtcolumn = "+0",
  })
end

return spec
