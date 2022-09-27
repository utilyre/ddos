local fterm = require("FTerm")
local tree = require("nvim-tree")
local api = require("nvim-tree.api")
local telescope = require("telescope")
local themes = require("telescope.themes")
local builtin = require("telescope.builtin")
local harpoon = require("harpoon")
local mark = require("harpoon.mark")
local ui = require("harpoon.ui")
local gitsigns = require("gitsigns")

_G.terminals = {}
local toggle_terminal = function(key)
  if _G.terminals[key] == nil then
    _G.terminals[key] = fterm:new({
      hl = "NormalFloat",
      border = "rounded",
      on_exit = function()
        _G.terminals[key] = nil

        local keys = vim.tbl_keys(_G.terminals)
        if _G.lastkey == key and #keys > 0 then
          _G.lastkey = keys[1]
        else
          _G.lastkey = nil
        end
      end,
    })
  end

  _G.lastkey = key
  _G.terminals[key]:toggle()
end

vim.keymap.set({ "n", "t" }, "<c-\\>", function()
  if _G.lastkey == nil then
    _G.lastkey = "t"
  end

  toggle_terminal(_G.lastkey)
end)
for _, key in ipairs({
  "a",
  "b",
  "c",
  "d",
  "e",
  "f",
  "g",
  "h",
  "i",
  "j",
  "k",
  "l",
  "m",
  "n",
  "o",
  "p",
  "q",
  "r",
  "s",
  "t",
  "u",
  "v",
  "w",
  "x",
  "y",
  "z",
}) do
  vim.keymap.set("n", "\\" .. key, vim.get_hof(toggle_terminal, key))
end

tree.setup({
  hijack_cursor = true,
  remove_keymaps = true,
  on_attach = function(bufnr)
    vim.keymap.set("n", "h", vim.get_hof(api.node.navigate.parent_close), { buffer = bufnr })
    vim.keymap.set("n", "l", vim.get_hof(api.node.open.edit), { buffer = bufnr })
    vim.keymap.set("n", "q", vim.get_hof(api.tree.close), { buffer = bufnr })
    vim.keymap.set("n", "r", vim.get_hof(api.tree.reload), { buffer = bufnr })
    vim.keymap.set("n", "d", vim.get_hof(api.fs.cut), { buffer = bufnr })
    vim.keymap.set("n", "y", vim.get_hof(api.fs.copy.node), { buffer = bufnr })
    vim.keymap.set("n", "p", vim.get_hof(api.fs.paste), { buffer = bufnr })
    vim.keymap.set("n", "c", vim.get_hof(api.fs.rename), { buffer = bufnr })
    vim.keymap.set("n", "x", vim.get_hof(api.fs.remove), { buffer = bufnr })
    vim.keymap.set("n", "a", vim.get_hof(api.fs.create), { buffer = bufnr })
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
      open_win_config = {
        width = 40,
        height = 40,
        row = (vim.api.nvim_win_get_height(0) / 2) - 20,
      },
    },
  },
  renderer = {
    group_empty = true,
    symlink_destination = false,
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

vim.keymap.set("n", "<c-/>", vim.get_hof(tree.toggle))

telescope.setup({
  defaults = themes.get_dropdown(),
})

vim.keymap.set("n", "<leader>fr", vim.get_hof(builtin.oldfiles))
vim.keymap.set("n", "<leader>ff", vim.get_hof(builtin.find_files))
vim.keymap.set("n", "<leader>fa", vim.get_hof(builtin.filetypes))
vim.keymap.set("n", "<leader>fw", vim.get_hof(builtin.live_grep))
vim.keymap.set("n", "<leader>fs", vim.get_hof(builtin.lsp_document_symbols))

harpoon.setup()

vim.keymap.set("n", "<cr>", vim.get_hof(mark.add_file))
vim.keymap.set("n", "<tab>", vim.get_hof(ui.toggle_quick_menu))

gitsigns.setup({
  preview_config = {
    border = "rounded",
  },
  on_attach = function(bufnr)
    vim.keymap.set("n", "<leader>gd", vim.get_hof(gitsigns.diffthis), { buffer = bufnr })
    vim.keymap.set("n", "<leader>gp", vim.get_hof(gitsigns.preview_hunk), { buffer = bufnr })
    vim.keymap.set("n", "<leader>gr", vim.get_hof(gitsigns.reset_hunk), { buffer = bufnr })
    vim.keymap.set("n", "<leader>ga", vim.get_hof(gitsigns.stage_hunk), { buffer = bufnr })
    vim.keymap.set("n", "<leader>gu", vim.get_hof(gitsigns.undo_stage_hunk), { buffer = bufnr })
    vim.keymap.set("n", "<leader>gk", vim.get_hof(gitsigns.prev_hunk), { buffer = bufnr })
    vim.keymap.set("n", "<leader>gj", vim.get_hof(gitsigns.next_hunk), { buffer = bufnr })
  end,
})
