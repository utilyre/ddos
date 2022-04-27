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
        p = { gitsigns.prev_hunk, "Preview" },
        r = { gitsigns.reset_hunk, "Reset" },
        R = { gitsigns.reset_buffer, "Reset all" },
        a = { gitsigns.stage_hunk, "Stage" },
        A = { gitsigns.stage_buffer, "Stage all" },
        k = { gitsigns.prev_hunk, "Previous" },
        j = { gitsigns.prev_hunk, "Next" },
        g = { function() Terminal:new({ cmd = "lazygit", direction = "float" }):toggle() end, "Lazygit" },
      },
    }, { prefix = "<leader>", buffer = buffnr })
  end,
})
