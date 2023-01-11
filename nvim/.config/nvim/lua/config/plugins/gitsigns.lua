local spec = {
  "lewis6991/gitsigns.nvim",
}

function spec.config()
  local gitsigns = require("gitsigns")

  gitsigns.setup({
    current_line_blame = true,
    current_line_blame_formatter = "<author> at <author_time:%R> - [<abbrev_sha>] <summary>",
    current_line_blame_formatter_nc = "<author>",
    current_line_blame_opts = {
      virt_text_priority = 10000,
    },
    preview_config = {
      border = "rounded",
    },
    on_attach = function(bufnr)
      local function map(left, right)
        vim.keymap.set("n", "<leader>g" .. left, right, { buffer = bufnr })
      end

      map("d", vim.callback(gitsigns.diffthis))
      map("p", vim.callback(gitsigns.preview_hunk))
      map("r", vim.callback(gitsigns.reset_hunk))
      map("a", vim.callback(gitsigns.stage_hunk))
      map("u", vim.callback(gitsigns.undo_stage_hunk))
      map("k", vim.callback(gitsigns.prev_hunk, { navigation_message = false }))
      map("j", vim.callback(gitsigns.next_hunk, { navigation_message = false }))
    end,
  })
end

return spec
