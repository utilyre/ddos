local spec = {
  "nvim-tree/nvim-tree.lua",
  dependencies = {
    "nvim-tree/nvim-web-devicons",
  },
}

function spec.config()
  local tree = require("nvim-tree")
  local api = require("nvim-tree.api")

  tree.setup({
    hijack_cursor = true,
    remove_keymaps = true,
    on_attach = function(bufnr)
      local function map(left, right)
        vim.keymap.set("n", left, right, { buffer = bufnr })
      end

      map("h", vim.callback(api.node.navigate.parent_close))
      map("l", vim.callback(api.node.open.edit))
      map("q", vim.callback(api.tree.close))
      map("r", vim.callback(api.tree.reload))
      map("d", vim.callback(api.fs.cut))
      map("y", vim.callback(api.fs.copy.node))
      map("p", vim.callback(api.fs.paste))
      map("c", vim.callback(api.fs.rename))
      map("x", vim.callback(api.fs.remove))
      map("a", vim.callback(api.fs.create))
    end,
    git = {
      ignore = false,
      show_on_open_dirs = false,
    },
    diagnostics = {
      enable = true,
      show_on_dirs = true,
      show_on_open_dirs = false,
      icons = {
        hint = vim.g.icons.widget.inline.Hint,
        info = vim.g.icons.widget.inline.Info,
        warning = vim.g.icons.widget.inline.Warn,
        error = vim.g.icons.widget.inline.Error,
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
          default = vim.g.icons.widget.inline.File,
          symlink = vim.g.icons.widget.inline.Link,
          folder = {
            arrow_closed = vim.g.icons.widget.inline.CaretRight,
            arrow_open = vim.g.icons.widget.inline.CaretDown,
            symlink = vim.g.icons.widget.inline.Link,
            default = vim.g.icons.widget.inline.Folder,
            open = vim.g.icons.widget.inline.FolderOpen,
            symlink_open = vim.g.icons.widget.inline.Link,
            empty = vim.g.icons.widget.outline.Folder,
            empty_open = vim.g.icons.widget.outline.FolderOpen,
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

  vim.keymap.set("n", "<c-/>", vim.callback(tree.toggle))
end

return spec
