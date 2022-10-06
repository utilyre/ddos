local mark = require("harpoon.mark")
local barbecue = require("barbecue")

barbecue.setup({
  custom_section = function()
    local bufnrs = vim.tbl_filter(function(bufnr)
      return vim.api.nvim_buf_is_loaded(bufnr) and vim.bo[bufnr].buftype == ""
    end, vim.api.nvim_list_bufs())

    return mark.get_length() .. "/" .. #bufnrs
  end,
  symbols = {
    modified = _G.icons.ui.Modified,
  },
  kinds = _G.icons.kind,
})
