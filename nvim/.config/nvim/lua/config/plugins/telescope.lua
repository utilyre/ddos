local spec = {
  "nvim-telescope/telescope.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons",
  },
}

function spec.config()
  local telescope = require("telescope")
  local themes = require("telescope.themes")
  local builtin = require("telescope.builtin")

  telescope.setup({
    defaults = vim.tbl_deep_extend("force", themes.get_dropdown(), {
      prompt_prefix = vim.g.icons.widget.inline.Telescope .. " ",
      selection_caret = vim.g.icons.widget.inline.ArrowRight .. " ",
      multi_icon = vim.g.icons.widget.inline.Check .. " ",
    }),
  })

  local function map(left, right)
    vim.keymap.set("n", "<leader>f" .. left, right)
  end

  map("h", vim.callback(builtin.help_tags))
  map("r", vim.callback(builtin.oldfiles))
  map("f", vim.callback(builtin.find_files))
  map("a", vim.callback(builtin.filetypes))
  map("w", vim.callback(builtin.live_grep))
end

return spec
