local spec = {
  "ghillb/cybu.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons",
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
      path = "tail",
      border = "rounded",
    },
    behavior = {
      show_on_autocmd = "BufLeave",
      mode = {
        auto = {
          view = "paging",
        },
      },
    },
  })
end

return spec
