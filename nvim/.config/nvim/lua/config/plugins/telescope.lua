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

  map("<leader>fh", vim.callback(builtin.help_tags))
  map("<leader>fr", vim.callback(builtin.oldfiles))
  map("<leader>ff", vim.callback(builtin.find_files))
  map("<leader>fa", vim.callback(builtin.filetypes))
  map("<leader>fw", vim.callback(builtin.live_grep))
end

return spec
