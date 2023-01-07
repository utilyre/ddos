local spec = {
  "lewis6991/gitsigns.nvim",
}

function spec.config()
  local gitsigns = require("gitsigns")

  gitsigns.setup({
    current_line_blame = true,
    current_line_blame_formatter = "    <author> <author_time:%R> - [<abbrev_sha>] <summary>",
    current_line_blame_formatter_nc = "    <author>",
    current_line_blame_opts = {
      virt_text_priority = 10000,
    },
    preview_config = {
      border = "rounded",
    },
    on_attach = function(bufnr)
      vim.keymap.set("n", "<leader>gd", vim.callback(gitsigns.diffthis), { buffer = bufnr })
      vim.keymap.set("n", "<leader>gp", vim.callback(gitsigns.preview_hunk), { buffer = bufnr })
      vim.keymap.set("n", "<leader>gr", vim.callback(gitsigns.reset_hunk), { buffer = bufnr })
      vim.keymap.set("n", "<leader>ga", vim.callback(gitsigns.stage_hunk), { buffer = bufnr })
      vim.keymap.set("n", "<leader>gu", vim.callback(gitsigns.undo_stage_hunk), { buffer = bufnr })
      vim.keymap.set("n", "<leader>gk", vim.callback(gitsigns.prev_hunk, { navigation_message = false }), { buffer = bufnr })
      vim.keymap.set("n", "<leader>gj", vim.callback(gitsigns.next_hunk, { navigation_message = false }), { buffer = bufnr })
    end,
  })
end

return spec
