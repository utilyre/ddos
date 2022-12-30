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
      mode = {
        auto = {
          view = "paging",
        },
      },
    },
  })

  vim.api.nvim_create_autocmd("BufLeave", {
    group = vim.api.nvim_create_augroup("cybu", {}),
    callback = function(a)
      if vim.bo[a.buf].buftype ~= "" then return end
      cybu.autocmd()
    end,
  })
end

return spec
