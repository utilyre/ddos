local gitsigns = require("gitsigns")
local Terminal = require("toggleterm.terminal").Terminal
local whichkey = require("which-key")

gitsigns.setup({
  current_line_blame = true,
  current_line_blame_formatter = "<author> - <summary> (<author_time:%R>)",
  on_attach = function(buffnr)
    whichkey.register({
      g = {
        name = "Git",
        p = { gitsigns.preview_hunk, "Preview" },
        r = { gitsigns.reset_hunk, "Reset" },
        a = { gitsigns.stage_hunk, "Stage" },
        k = { gitsigns.prev_hunk, "Previous" },
        j = { gitsigns.next_hunk, "Next" },
        c = { function() Terminal:new({ cmd = "lazygit" }):toggle() end, "Control" },
      },
    }, { prefix = "<leader>", buffer = buffnr })
  end,
})
