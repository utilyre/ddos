local tree = require("nvim-tree")

vim.g.nvim_tree_group_empty = 1
vim.g.nvim_tree_symlink_arrow = " -> "
vim.g.nvim_tree_icons = {
  default = vim.g.symbols.documents.File,
  symlink = vim.g.symbols.documents.Link,
  git = {
    untracked = vim.g.symbols.git.Untracked,
    staged = vim.g.symbols.git.Added,
    unstaged = vim.g.symbols.git.Modified,
    renamed = vim.g.symbols.git.Renamed,
    deleted = vim.g.symbols.git.Deleted,
    unmerged = vim.g.symbols.git.Unmerged,
    ignored = vim.g.symbols.git.Ignored,
  },
  folder = {
    arrow_open = vim.g.symbols.ui.Opened,
    arrow_closed = vim.g.symbols.ui.Closed,
    default = vim.g.symbols.documents.Folder,
    open = vim.g.symbols.documents.Open,
    empty = vim.g.symbols.documents.Empty,
    empty_open = vim.g.symbols.documents.EmptyOpen,
    symlink = vim.g.symbols.documents.Link,
    symlink_open = vim.g.symbols.documents.Open,
  }
}

tree.setup({
  update_cwd = true,
  diagnostics = { enable = true },
  git = { ignore = false },
  view = {
    width = 40,
    hide_root_folder = true,
    mappings = {
      custom_only = true,
      list = {
        { key = "h", action = "close_node" },
        { key = { "l", "<2-leftmouse>" }, action = "edit" },
        { key = "r", action = "refresh" },
        { key = "d", action = "cut" },
        { key = "y", action = "copy" },
        { key = "p", action = "paste" },
        { key = "c", action = "rename" },
        { key = "x", action = "remove" },
        { key = "a", action = "create" },
      },
    },
  },
})

vim.keymap.set("n", "<c-p>", tree.toggle)
