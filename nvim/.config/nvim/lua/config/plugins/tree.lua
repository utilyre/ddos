local tree = require("nvim-tree")
local api = require("nvim-tree.api")

tree.setup({
  hijack_cursor = true,
  remove_keymaps = true,
  on_attach = function(bufnr)
    vim.keymap.set("n", "h", vim.fun_lambda(api.node.navigate.parent_close), { buffer = bufnr })
    vim.keymap.set("n", "l", vim.fun_lambda(api.node.open.edit), { buffer = bufnr })
    vim.keymap.set("n", "q", vim.fun_lambda(api.tree.close), { buffer = bufnr })
    vim.keymap.set("n", "r", vim.fun_lambda(api.tree.reload), { buffer = bufnr })
    vim.keymap.set("n", "d", vim.fun_lambda(api.fs.cut), { buffer = bufnr })
    vim.keymap.set("n", "y", vim.fun_lambda(api.fs.copy.node), { buffer = bufnr })
    vim.keymap.set("n", "p", vim.fun_lambda(api.fs.paste), { buffer = bufnr })
    vim.keymap.set("n", "c", vim.fun_lambda(api.fs.rename), { buffer = bufnr })
    vim.keymap.set("n", "x", vim.fun_lambda(api.fs.remove), { buffer = bufnr })
    vim.keymap.set("n", "a", vim.fun_lambda(api.fs.create), { buffer = bufnr })
  end,
  git = {
    enable = true,
    ignore = false,
  },
  diagnostics = {
    enable = true,
    show_on_dirs = true,
    icons = {
      hint = vim.g.icons.diagnostic.Suggestion,
      info = vim.g.icons.diagnostic.Information,
      warning = vim.g.icons.diagnostic.Warning,
      error = vim.g.icons.diagnostic.Error,
    },
  },
  view = {
    hide_root_folder = true,
    float = {
      enable = true,
      open_win_config = function()
        return {
          relative = "editor",
          border = "rounded",
          width = 40,
          height = 40,
          row = (vim.go.lines / 2) - 20,
          col = 2,
        }
      end,
    },
  },
  renderer = {
    group_empty = true,
    symlink_destination = false,
    highlight_git = true,
    indent_markers = {
      enable = true,
    },
    icons = {
      git_placement = "after",
      glyphs = {
        default = vim.g.icons.document.File,
        symlink = vim.g.icons.document.Link,
        folder = {
          arrow_closed = vim.g.icons.ui.Collapsed,
          arrow_open = vim.g.icons.ui.Expanded,
          symlink = vim.g.icons.document.Link,
          default = vim.g.icons.document.Folder,
          open = vim.g.icons.document.Open,
          symlink_open = vim.g.icons.document.Open,
          empty = vim.g.icons.document.Empty,
          empty_open = vim.g.icons.document.EmptyOpen,
        },
        git = {
          untracked = vim.g.icons.git.Untracked,
          staged = vim.g.icons.git.Added,
          unstaged = vim.g.icons.git.Modified,
          renamed = vim.g.icons.git.Renamed,
          deleted = vim.g.icons.git.Deleted,
          unmerged = vim.g.icons.git.Unmerged,
          ignored = vim.g.icons.git.Ignored,
        },
      },
    },
  },
})

vim.keymap.set("n", "<c-/>", vim.fun_lambda(tree.toggle))
