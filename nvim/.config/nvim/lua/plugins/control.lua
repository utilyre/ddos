local project = require("project_nvim")
local gitsigns = require("gitsigns")
local gitconflict = require("git-conflict")

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

gitconflict.setup({
  default_mappings = false,
  disable_diagnostics = true,
})

vim.api.nvim_create_augroup("gitconflict", {})
vim.api.nvim_create_autocmd("User", {
  group = "gitconflict",
  pattern = "GitConflictDetected",
  callback = function(a)
    vim.keymap.set("n", "<leader>go", vim.get_hof(gitconflict.choose, "ours"), { buffer = a.buf })
    vim.keymap.set("n", "<leader>gt", vim.get_hof(gitconflict.choose, "theirs"), { buffer = a.buf })
    vim.keymap.set("n", "<leader>gb", vim.get_hof(gitconflict.choose, "both"), { buffer = a.buf })
    vim.keymap.set("n", "<leader>gn", vim.get_hof(gitconflict.choose, "none"), { buffer = a.buf })
  end,
})
vim.api.nvim_create_autocmd("User", {
  group = "gitconflict",
  pattern = "GitConflictResolved",
  callback = function(a)
    vim.keymap.del("n", "<leader>go", { buffer = a.buf })
    vim.keymap.del("n", "<leader>gt", { buffer = a.buf })
    vim.keymap.del("n", "<leader>gb", { buffer = a.buf })
    vim.keymap.del("n", "<leader>gn", { buffer = a.buf })
  end,
})
