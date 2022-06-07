local signs = require("gitsigns")
local conflict = require("git-conflict")
local whichkey = require("which-key")

signs.setup({
  current_line_blame = true,
  current_line_blame_formatter = "  " .. vim.g.symbols.ui.Circle .. " <abbrev_sha>: <author> (<author_time:%R>) - <summary>",
  current_line_blame_formatter_nc = "  " .. vim.g.symbols.ui.Circle .. " <author>",
  on_attach = function(buffnr)
    whichkey.register({
      g = {
        name = "Git",
        d = { vim.api.nvim_create_hof(signs.diffthis), "Diff" },
        p = { vim.api.nvim_create_hof(signs.preview_hunk), "Preview" },
        s = { vim.api.nvim_create_hof(signs.select_hunk), "Select" },
        r = { vim.api.nvim_create_hof(signs.reset_hunk), "Reset" },
        a = { vim.api.nvim_create_hof(signs.stage_hunk), "Stage" },
        u = { vim.api.nvim_create_hof(signs.undo_stage_hunk), "Undo" },
        k = { vim.api.nvim_create_hof(signs.prev_hunk), "Previous" },
        j = { vim.api.nvim_create_hof(signs.next_hunk), "Next" },
      },
    }, { prefix = "<leader>", buffer = buffnr })
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
