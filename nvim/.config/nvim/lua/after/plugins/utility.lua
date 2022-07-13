local cmp = require("cmp")
local autopairs = require("nvim-autopairs")
local completion = require("nvim-autopairs.completion.cmp")
local comment = require("Comment")
local gitsigns = require("gitsigns")
local gitconflict = require("git-conflict")

autopairs.setup({
  check_ts = true,
})

cmp.event:on("confirm_done", completion.on_confirm_done())

comment.setup({
  mappings = {
    basic = true,
    extra = true,
    extended = true,
  },
})

gitsigns.setup({
  current_line_blame = true,
  current_line_blame_formatter = "  " .. vim.g.symbols.ui.Circle .. " <abbrev_sha>: <author> (<author_time:%R>) - <summary>",
  current_line_blame_formatter_nc = "  " .. vim.g.symbols.ui.Circle .. " <author>",
  on_attach = function(buffnr)
    vim.keymap.set("n", "<leader>gd", vim.api.nvim_create_hof(gitsigns.diffthis))
    vim.keymap.set("n", "<leader>gp", vim.api.nvim_create_hof(gitsigns.preview_hunk))
    vim.keymap.set("n", "<leader>gr", vim.api.nvim_create_hof(gitsigns.reset_hunk))
    vim.keymap.set("n", "<leader>ga", vim.api.nvim_create_hof(gitsigns.stage_hunk))
    vim.keymap.set("n", "<leader>gu", vim.api.nvim_create_hof(gitsigns.undo_stage_hunk))
    vim.keymap.set("n", "<leader>gk", vim.api.nvim_create_hof(gitsigns.prev_hunk))
    vim.keymap.set("n", "<leader>gj", vim.api.nvim_create_hof(gitsigns.next_hunk))
  end,
})

gitconflict.setup({
  default_mappings = false,
  disable_diagnostics = true,
})

local gGitConflict = vim.api.nvim_create_augroup("GitConflict", {})
vim.api.nvim_create_autocmd("User", {
  group = gGitConflict,
  pattern = "GitConflictDetected",
  callback = function(args)
    vim.keymap.set("n", "<leader>go", vim.api.nvim_create_hof(gitconflict.choose, "ours"), { buffer = args.buf })
    vim.keymap.set("n", "<leader>gt", vim.api.nvim_create_hof(gitconflict.choose, "theirs"), { buffer = args.buf })
    vim.keymap.set("n", "<leader>gb", vim.api.nvim_create_hof(gitconflict.choose, "both"), { buffer = args.buf })
    vim.keymap.set("n", "<leader>gn", vim.api.nvim_create_hof(gitconflict.choose, "none"), { buffer = args.buf })
  end,
})
vim.api.nvim_create_autocmd("User", {
  group = gGitConflict,
  pattern = "GitConflictResolved",
  callback = function(args)
    vim.keymap.del("n", "<leader>go", { buffer = args.buf })
    vim.keymap.del("n", "<leader>gt", { buffer = args.buf })
    vim.keymap.del("n", "<leader>gb", { buffer = args.buf })
    vim.keymap.del("n", "<leader>gn", { buffer = args.buf })
  end,
})
