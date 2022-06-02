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
        d = { F(gitsigns.diffthis), "Diff" },
        p = { F(gitsigns.preview_hunk), "Preview" },
        s = { F(gitsigns.select_hunk), "Select" },
        r = { F(gitsigns.reset_hunk), "Reset" },
        a = { F(gitsigns.stage_hunk), "Stage" },
        u = { F(gitsigns.undo_stage_hunk), "Undo" },
        k = { F(gitsigns.prev_hunk), "Previous" },
        j = { F(gitsigns.next_hunk), "Next" },
      },
    }, { prefix = "<leader>", buffer = buffnr })
  end,
})
