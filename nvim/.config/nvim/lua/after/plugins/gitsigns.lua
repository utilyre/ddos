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
        d = { vim.api.nvim_create_hof(gitsigns.diffthis), "Diff" },
        p = { vim.api.nvim_create_hof(gitsigns.preview_hunk), "Preview" },
        s = { vim.api.nvim_create_hof(gitsigns.select_hunk), "Select" },
        r = { vim.api.nvim_create_hof(gitsigns.reset_hunk), "Reset" },
        a = { vim.api.nvim_create_hof(gitsigns.stage_hunk), "Stage" },
        u = { vim.api.nvim_create_hof(gitsigns.undo_stage_hunk), "Undo" },
        k = { vim.api.nvim_create_hof(gitsigns.prev_hunk), "Previous" },
        j = { vim.api.nvim_create_hof(gitsigns.next_hunk), "Next" },
      },
    }, { prefix = "<leader>", buffer = buffnr })
  end,
})
