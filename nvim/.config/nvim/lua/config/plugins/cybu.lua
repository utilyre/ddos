local spec = {
  "ghillb/cybu.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "kyazdani42/nvim-web-devicons",
  },
}

function spec.config()
  local cybu = require("cybu")

  cybu.setup({
    position = {
      relative_to = "editor",
      anchor = "bottomcenter",
    },
    style = {
      hide_buffer_id = true,
      border = "rounded",
    },
    behavior = {
      mode = {
        default = {
          view = "paging",
        },
      },
    },
  })

  vim.keymap.set("n", "<s-tab>", vim.callback(cybu.cycle, "prev"))
  vim.keymap.set("n", "<tab>", vim.callback(cybu.cycle, "next"))
end

return spec
