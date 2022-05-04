local tree = require("nvim-tree")

vim.g.nvim_tree_group_empty = 1
vim.g.nvim_tree_symlink_arrow = " -> "
vim.g.nvim_tree_icons = {
  default = "",
  symlink = "",
  git = {
    unstaged = "",
    staged = "",
    renamed = "",
    deleted = "",
    untracked = "",
    ignored = "",
  },
  folder = {
    arrow_open = "",
    arrow_closed = "",
    default = "",
    open = "",
    empty = "",
    empty_open = "",
    symlink = "",
    symlink_open = "",
  }
}

tree.setup({
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

vim.keymap.set("n", "<c-p>", "<cmd>NvimTreeToggle<cr>")
