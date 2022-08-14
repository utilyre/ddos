local cybu = require("cybu")
local tree = require("nvim-tree")
local telescope = require("telescope")
local themes = require("telescope.themes")
local builtin = require("telescope.builtin")

cybu.setup({
  position = {
    anchor = "bottomright",
    vertical_offset = 2,
    horizontal_offset = 2,
  },
  style = {
    hide_buffer_id = true,
    border = "rounded",
    highlights = {
      adjacent_buffers = "NormalFloat",
      background = "NormalFloat",
    },
  },
})

vim.keymap.set("n", "<s-k>", vim.get_hof(cybu.cycle, "prev"))
vim.keymap.set("n", "<s-j>", vim.get_hof(cybu.cycle, "next"))

tree.setup({
  update_cwd = true,
  git = {
    ignore = false,
  },
  diagnostics = {
    enable = true,
    show_on_dirs = true,
  },
  view = {
    hide_root_folder = true,
    width = 40,
    float= {
      enable = true,
    },
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
        default = _G.icons.document.File,
        symlink = _G.icons.document.Link,
        folder = {
          arrow_closed = _G.icons.ui.Collapsed,
          arrow_open = _G.icons.ui.Expanded,
          symlink = _G.icons.document.Link,
          default = _G.icons.document.Folder,
          open = _G.icons.document.Open,
          symlink_open = _G.icons.document.Open,
          empty = _G.icons.document.Empty,
          empty_open = _G.icons.document.EmptyOpen,
        },
        git = {
          untracked = _G.icons.git.Untracked,
          staged = _G.icons.git.Added,
          unstaged = _G.icons.git.Modified,
          renamed = _G.icons.git.Renamed,
          deleted = _G.icons.git.Deleted,
          unmerged = _G.icons.git.Unmerged,
          ignored = _G.icons.git.Ignored,
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
