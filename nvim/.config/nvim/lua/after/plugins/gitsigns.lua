local gitsigns = require("gitsigns")
local builtin = require("telescope.builtin")
local termexec = _G.termexec

gitsigns.setup({
  current_line_blame = true,
  current_line_blame_formatter = "<author> - <summary> (<author_time:%R>)",
  on_attach = function(buffnr)
    local opts = { buffer = buffnr }
    vim.keymap.set("n", "<leader>gp", gitsigns.preview_hunk, opts)
    vim.keymap.set("n", "<leader>gr", gitsigns.reset_hunk, opts)
    vim.keymap.set("n", "<leader>gR", gitsigns.reset_buffer, opts)
    vim.keymap.set("n", "<leader>ga", gitsigns.stage_hunk, opts)
    vim.keymap.set("n", "<leader>gA", gitsigns.stage_buffer, opts)
    vim.keymap.set("n", "<leader>gk", gitsigns.prev_hunk, opts)
    vim.keymap.set("n", "<leader>gj", gitsigns.next_hunk, opts)
    vim.keymap.set("n", "<leader>gc", builtin.git_commits, opts)
    vim.keymap.set("n", "<leader>gb", builtin.git_branches, opts)
    vim.keymap.set("n", "<leader>gl", function() termexec("lazygit") end, opts)
  end,
})
