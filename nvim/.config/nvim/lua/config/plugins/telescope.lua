local spec = {
  "nvim-telescope/telescope.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
  },
}

function spec.config()
  local telescope = require("telescope")
  local themes = require("telescope.themes")
  local builtin = require("telescope.builtin")

  telescope.setup({
    defaults = vim.tbl_deep_extend("force", themes.get_dropdown(), {
      prompt_prefix = vim.g.icons.widget.Search .. " ",
      selection_caret = vim.g.icons.widget.Caret .. " ",
      multi_icon = vim.g.icons.widget.Tag .. " ",
    }),
  })

  vim.keymap.set("n", "<leader>fh", vim.callback(builtin.help_tags))
  vim.keymap.set("n", "<leader>fr", vim.callback(builtin.oldfiles))
  vim.keymap.set("n", "<leader>ff", vim.callback(builtin.find_files))
  vim.keymap.set("n", "<leader>fa", vim.callback(builtin.filetypes))
  vim.keymap.set("n", "<leader>fw", vim.callback(builtin.live_grep))
end

return spec
