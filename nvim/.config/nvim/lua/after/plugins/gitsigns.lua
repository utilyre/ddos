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
        d = { vim.hof(gitsigns.diffthis), "Diff" },
        p = { vim.hof(gitsigns.preview_hunk), "Preview" },
        s = { vim.hof(gitsigns.select_hunk), "Select" },
        r = { vim.hof(gitsigns.reset_hunk), "Reset" },
        a = { vim.hof(gitsigns.stage_hunk), "Stage" },
        u = { vim.hof(gitsigns.undo_stage_hunk), "Undo" },
        k = { vim.hof(gitsigns.prev_hunk), "Previous" },
        j = { vim.hof(gitsigns.next_hunk), "Next" },
      },
    }, { prefix = "<leader>", buffer = buffnr })
  end,
})
