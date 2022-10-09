local barbecue = require("barbecue")
local mark = require("harpoon.mark")

barbecue.setup({
  custom_section = function()
    local bufnrs = table.filter(vim.api.nvim_list_bufs(), function(bufnr)
      return vim.api.nvim_buf_is_loaded(bufnr) and vim.bo[bufnr].buftype == ""
    end)

    return mark.get_length() .. "/" .. #bufnrs
  end,
  symbols = {
    modified = vim.g.icons.ui.Modified,
  },
  kinds = vim.g.icons.kind,
})
