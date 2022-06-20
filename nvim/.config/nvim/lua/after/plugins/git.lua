local signs = require("gitsigns")
local conflict = require("git-conflict")

signs.setup({
  current_line_blame = true,
  current_line_blame_formatter = "  " .. vim.g.symbols.ui.Circle .. " <abbrev_sha>: <author> (<author_time:%R>) - <summary>",
  current_line_blame_formatter_nc = "  " .. vim.g.symbols.ui.Circle .. " <author>",
  on_attach = function(buffnr)
    vim.keymap.set("n", "<leader>gd", vim.api.nvim_create_hof(signs.diffthis))
    vim.keymap.set("n", "<leader>gp", vim.api.nvim_create_hof(signs.preview_hunk))
    vim.keymap.set("n", "<leader>gs", vim.api.nvim_create_hof(signs.select_hunk))
    vim.keymap.set("n", "<leader>gr", vim.api.nvim_create_hof(signs.reset_hunk))
    vim.keymap.set("n", "<leader>ga", vim.api.nvim_create_hof(signs.stage_hunk))
    vim.keymap.set("n", "<leader>gu", vim.api.nvim_create_hof(signs.undo_stage_hunk))
    vim.keymap.set("n", "<leader>gk", vim.api.nvim_create_hof(signs.prev_hunk))
    vim.keymap.set("n", "<leader>gj", vim.api.nvim_create_hof(signs.next_hunk))
  end,
})

conflict.setup({
  default_mappings = false,
  disable_diagnostics = true,
})

local gGit = vim.api.nvim_create_augroup("Git", {})
vim.api.nvim_create_autocmd("User", {
  group = gGit,
  pattern = "GitConflictDetected",
  callback = function(args)
    vim.keymap.set("n", "co", vim.api.nvim_create_hof(conflict.choose, "ours"), { buffer = args.buf })
    vim.keymap.set("n", "ct", vim.api.nvim_create_hof(conflict.choose, "theirs"), { buffer = args.buf })
    vim.keymap.set("n", "cb", vim.api.nvim_create_hof(conflict.choose, "both"), { buffer = args.buf })
    vim.keymap.set("n", "cn", vim.api.nvim_create_hof(conflict.choose, "none"), { buffer = args.buf })
  end,
})
vim.api.nvim_create_autocmd("User", {
  group = gGit,
  pattern = "GitConflictResolved",
  callback = function(args)
    vim.keymap.del("n", "co", { buffer = args.buf })
    vim.keymap.del("n", "ct", { buffer = args.buf })
    vim.keymap.del("n", "cb", { buffer = args.buf })
    vim.keymap.del("n", "cn", { buffer = args.buf })
  end,
})
