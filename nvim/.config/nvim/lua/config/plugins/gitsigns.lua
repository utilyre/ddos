local gitsigns = require("gitsigns")

gitsigns.setup({
  preview_config = {
    border = "rounded",
  },
  on_attach = function(bufnr)
    vim.keymap.set("n", "<leader>gd", vim.callback(gitsigns.diffthis), { buffer = bufnr })
    vim.keymap.set("n", "<leader>gb", vim.callback(gitsigns.blame_line, { full = true }), { buffer = bufnr })
    vim.keymap.set("n", "<leader>gp", vim.callback(gitsigns.preview_hunk), { buffer = bufnr })
    vim.keymap.set("n", "<leader>gr", vim.callback(gitsigns.reset_hunk), { buffer = bufnr })
    vim.keymap.set("n", "<leader>ga", vim.callback(gitsigns.stage_hunk), { buffer = bufnr })
    vim.keymap.set("n", "<leader>gu", vim.callback(gitsigns.undo_stage_hunk), { buffer = bufnr })
    vim.keymap.set("n", "<leader>gk", vim.callback(gitsigns.prev_hunk), { buffer = bufnr })
    vim.keymap.set("n", "<leader>gj", vim.callback(gitsigns.next_hunk), { buffer = bufnr })
  end,
})
