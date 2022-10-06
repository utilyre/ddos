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
      hint = _G.icons.diagnostic.Suggestion,
      info = _G.icons.diagnostic.Information,
      warning = _G.icons.diagnostic.Warning,
      error = _G.icons.diagnostic.Error,
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

vim.keymap.set("n", "<c-/>", vim.fun_lambda(tree.toggle))
