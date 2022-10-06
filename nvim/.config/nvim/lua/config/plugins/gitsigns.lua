local gitsigns = require("gitsigns")

gitsigns.setup({
  preview_config = {
    border = "rounded",
  },
  on_attach = function(bufnr)
    vim.keymap.set("n", "<leader>gd", vim.fun_lambda(gitsigns.diffthis), { buffer = bufnr })
    vim.keymap.set("n", "<leader>gb", vim.fun_lambda(gitsigns.blame_line), { buffer = bufnr })
    vim.keymap.set("n", "<leader>gp", vim.fun_lambda(gitsigns.preview_hunk), { buffer = bufnr })
    vim.keymap.set("n", "<leader>gr", vim.fun_lambda(gitsigns.reset_hunk), { buffer = bufnr })
    vim.keymap.set("n", "<leader>gR", vim.fun_lambda(gitsigns.reset_buffer), { buffer = bufnr })
    vim.keymap.set("n", "<leader>ga", vim.fun_lambda(gitsigns.stage_hunk), { buffer = bufnr })
    vim.keymap.set("n", "<leader>gA", vim.fun_lambda(gitsigns.stage_buffer), { buffer = bufnr })
    vim.keymap.set("n", "<leader>gu", vim.fun_lambda(gitsigns.undo_stage_hunk), { buffer = bufnr })
    vim.keymap.set("n", "<leader>gk", vim.fun_lambda(gitsigns.prev_hunk), { buffer = bufnr })
    vim.keymap.set("n", "<leader>gj", vim.fun_lambda(gitsigns.next_hunk), { buffer = bufnr })
  end,
})
