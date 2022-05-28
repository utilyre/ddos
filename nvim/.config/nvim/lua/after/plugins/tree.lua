local tree = require("nvim-tree")

tree.setup({
  update_cwd = true,
  git = { ignore = false },
  diagnostics = { enable = true },
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
  renderer = {
    group_empty = true,
    icons = {
      symlink_arrow = " -> ",
      glyphs = {
        symlink = vim.g.symbols.document.Link,
        default = vim.g.symbols.document.File,
        folder = {
          arrow_closed = vim.g.symbols.ui.Closed,
          arrow_open = vim.g.symbols.ui.Opened,
          symlink = vim.g.symbols.document.Link,
          default = vim.g.symbols.document.Folder,
          open = vim.g.symbols.document.Open,
          symlink_open = vim.g.symbols.document.Open,
          empty = vim.g.symbols.document.Empty,
          empty_open = vim.g.symbols.document.EmptyOpen,
        },
        git = {
          untracked = vim.g.symbols.git.Untracked,
          staged = vim.g.symbols.git.Added,
          unstaged = vim.g.symbols.git.Modified,
          renamed = vim.g.symbols.git.Renamed,
          deleted = vim.g.symbols.git.Deleted,
          unmerged = vim.g.symbols.git.Unmerged,
          ignored = vim.g.symbols.git.Ignored,
        },
      },
    },
  },
})

vim.keymap.set("n", "<c-p>", tree.toggle)
