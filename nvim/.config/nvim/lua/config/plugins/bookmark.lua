local spec = {
  "mattesgroeger/vim-bookmarks",
  dependencies = {
    "nvim-telescope/telescope.nvim",
    "tom-anders/telescope-vim-bookmarks.nvim",
  },
}

function spec.config()
  local telescope = require("telescope")

  vim.g.bookmark_save_per_working_dir = 1
  vim.g.bookmark_no_default_key_mappings = 1
  vim.g.bookmark_sign = vim.g.icons.widget.Bookmark
  vim.g.bookmark_annotation_sign = vim.g.icons.widget.Note

  vim.keymap.set("n", "<leader>bb", vim.callback(vim.cmd.BookmarkToggle))
  vim.keymap.set("n", "<leader>bn", vim.callback(vim.cmd.BookmarkAnnotate))
  vim.keymap.set("n", "<leader>bk", vim.callback(vim.cmd.BookmarkPrev))
  vim.keymap.set("n", "<leader>bj", vim.callback(vim.cmd.BookmarkNext))

  telescope.load_extension("vim_bookmarks")
  vim.keymap.set("n", "<leader>fb", vim.callback(telescope.extensions.vim_bookmarks.all))
end

return spec
