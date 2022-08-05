local project = require("project_nvim")
local gitsigns = require("gitsigns")

project.setup({
  manual_mode = true,
})

gitsigns.setup({
  on_attach = function(bufnr)
    vim.keymap.set("n", "<leader>gd", vim.get_hof(gitsigns.diffthis), { buffer = bufnr })
    vim.keymap.set("n", "<leader>gp", vim.get_hof(gitsigns.preview_hunk), { buffer = bufnr })
    vim.keymap.set("n", "<leader>gr", vim.get_hof(gitsigns.reset_hunk), { buffer = bufnr })
    vim.keymap.set("n", "<leader>ga", vim.get_hof(gitsigns.stage_hunk), { buffer = bufnr })
    vim.keymap.set("n", "<leader>gu", vim.get_hof(gitsigns.undo_stage_hunk), { buffer = bufnr })
    vim.keymap.set("n", "<leader>gk", vim.get_hof(gitsigns.prev_hunk), { buffer = bufnr })
    vim.keymap.set("n", "<leader>gj", vim.get_hof(gitsigns.next_hunk), { buffer = bufnr })
  end,
})
