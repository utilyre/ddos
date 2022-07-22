local project = require("project_nvim")
local gitsigns = require("gitsigns")
local gitconflict = require("git-conflict")

project.setup({
  manual_mode = true,
})

gitsigns.setup({
  current_line_blame = true,
  current_line_blame_formatter = "  " .. _G.icons.ui.Circle .. " <abbrev_sha>: <author> (<author_time:%R>) - <summary>",
  current_line_blame_formatter_nc = "  " .. _G.icons.ui.Circle .. " <author>",
  on_attach = function(buffnr)
    vim.keymap.set("n", "<leader>gd", vim.get_hof(gitsigns.diffthis), { buffer = buffnr })
    vim.keymap.set("n", "<leader>gp", vim.get_hof(gitsigns.preview_hunk), { buffer = buffnr })
    vim.keymap.set("n", "<leader>gr", vim.get_hof(gitsigns.reset_hunk), { buffer = buffnr })
    vim.keymap.set("n", "<leader>ga", vim.get_hof(gitsigns.stage_hunk), { buffer = buffnr })
    vim.keymap.set("n", "<leader>gu", vim.get_hof(gitsigns.undo_stage_hunk), { buffer = buffnr })
    vim.keymap.set("n", "<leader>gk", vim.get_hof(gitsigns.prev_hunk), { buffer = buffnr })
    vim.keymap.set("n", "<leader>gj", vim.get_hof(gitsigns.next_hunk), { buffer = buffnr })
  end,
})

gitconflict.setup({
  default_mappings = false,
  disable_diagnostics = true,
})

local GitConflict = vim.api.nvim_create_augroup("GitConflict", { clear = false })
vim.api.nvim_create_autocmd("User", {
  group = GitConflict,
  pattern = "GitConflictDetected",
  callback = function(args)
    vim.keymap.set("n", "<leader>go", vim.get_hof(gitconflict.choose, "ours"), { buffer = args.buf })
    vim.keymap.set("n", "<leader>gt", vim.get_hof(gitconflict.choose, "theirs"), { buffer = args.buf })
    vim.keymap.set("n", "<leader>gb", vim.get_hof(gitconflict.choose, "both"), { buffer = args.buf })
    vim.keymap.set("n", "<leader>gn", vim.get_hof(gitconflict.choose, "none"), { buffer = args.buf })
  end,
})
vim.api.nvim_create_autocmd("User", {
  group = GitConflict,
  pattern = "GitConflictResolved",
  callback = function(args)
    vim.keymap.del("n", "<leader>go", { buffer = args.buf })
    vim.keymap.del("n", "<leader>gt", { buffer = args.buf })
    vim.keymap.del("n", "<leader>gb", { buffer = args.buf })
    vim.keymap.del("n", "<leader>gn", { buffer = args.buf })
  end,
})
