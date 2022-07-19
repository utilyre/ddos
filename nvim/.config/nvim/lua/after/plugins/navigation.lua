local reach = require("reach")
local tree = require("nvim-tree")
local telescope = require("telescope")
local themes = require("telescope.themes")
local builtin = require("telescope.builtin")

reach.setup()

vim.keymap.set("n", "<tab>", vim.get_hof(reach.buffers, {
  show_current = true,
  handle = "dynamic",
  modified_icon = "[+]",
}))

tree.setup({
  update_cwd = true,
  git = { ignore = false },
  diagnostics = {
    enable = true,
    show_on_dirs = true,
  },
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
    symlink_destination = false,
    icons = {
      git_placement = "after",
      glyphs = {
        default = _G.symbols.document.File,
        symlink = _G.symbols.document.Link,
        folder = {
          arrow_closed = _G.symbols.ui.Closed,
          arrow_open = _G.symbols.ui.Open,
          symlink = _G.symbols.document.Link,
          default = _G.symbols.document.Folder,
          open = _G.symbols.document.Open,
          symlink_open = _G.symbols.document.Open,
          empty = _G.symbols.document.Empty,
          empty_open = _G.symbols.document.EmptyOpen,
        },
        git = {
          untracked = _G.symbols.git.Untracked,
          staged = _G.symbols.git.Added,
          unstaged = _G.symbols.git.Modified,
          renamed = _G.symbols.git.Renamed,
          deleted = _G.symbols.git.Deleted,
          unmerged = _G.symbols.git.Unmerged,
          ignored = _G.symbols.git.Ignored,
        },
      },
    },
  },
})

vim.keymap.set("n", "<c-_>", vim.get_hof(tree.toggle))

telescope.setup({
  defaults = themes.get_dropdown(),
})

vim.keymap.set("n", "<leader>fr", vim.get_hof(builtin.oldfiles))
vim.keymap.set("n", "<leader>ff", vim.get_hof(builtin.find_files))
vim.keymap.set("n", "<leader>fa", vim.get_hof(builtin.filetypes))
vim.keymap.set("n", "<leader>fw", vim.get_hof(builtin.live_grep))
vim.keymap.set("n", "<leader>fs", vim.get_hof(builtin.lsp_document_symbols))
