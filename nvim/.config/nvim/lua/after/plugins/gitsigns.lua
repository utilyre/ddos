local gitsigns = require("gitsigns")
local whichkey = require("which-key")

gitsigns.setup({
  current_line_blame = true,
  current_line_blame_formatter = "  " .. vim.g.symbols.ui.Circle .. " <abbrev_sha>: <author> (<author_time:%R>) - <summary>",
  current_line_blame_formatter_nc = "  " .. vim.g.symbols.ui.Circle .. " <author>",
  on_attach = function(buffnr)
    whichkey.register({
      g = {
        name = "Git",
        d = { vim.fun_create_hof(gitsigns.diffthis), "Diff" },
        p = { vim.fun_create_hof(gitsigns.preview_hunk), "Preview" },
        s = { vim.fun_create_hof(gitsigns.select_hunk), "Select" },
        r = { vim.fun_create_hof(gitsigns.reset_hunk), "Reset" },
        a = { vim.fun_create_hof(gitsigns.stage_hunk), "Stage" },
        u = { vim.fun_create_hof(gitsigns.undo_stage_hunk), "Undo" },
        k = { vim.fun_create_hof(gitsigns.prev_hunk), "Previous" },
        j = { vim.fun_create_hof(gitsigns.next_hunk), "Next" },
      },
    }, { prefix = "<leader>", buffer = buffnr })
  end,
})
