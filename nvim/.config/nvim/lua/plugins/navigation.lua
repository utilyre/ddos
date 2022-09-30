local fterm = require("FTerm")
local tree = require("nvim-tree")
local api = require("nvim-tree.api")
local telescope = require("telescope")
local themes = require("telescope.themes")
local builtin = require("telescope.builtin")
local harpoon = require("harpoon")
local ui = require("harpoon.ui")
local mark = require("harpoon.mark")

_G.terminals = {}
local toggle_terminal = function(key)
  key = key or _G.lastkey or "t"

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

vim.keymap.set({ "n", "t" }, "<c-\\>", vim.get_hof(toggle_terminal))
vim.keymap.set("n", "\\a", vim.get_hof(toggle_terminal, "a"))
vim.keymap.set("n", "\\b", vim.get_hof(toggle_terminal, "b"))
vim.keymap.set("n", "\\c", vim.get_hof(toggle_terminal, "c"))
vim.keymap.set("n", "\\d", vim.get_hof(toggle_terminal, "d"))
vim.keymap.set("n", "\\e", vim.get_hof(toggle_terminal, "e"))
vim.keymap.set("n", "\\f", vim.get_hof(toggle_terminal, "f"))
vim.keymap.set("n", "\\g", vim.get_hof(toggle_terminal, "g"))
vim.keymap.set("n", "\\h", vim.get_hof(toggle_terminal, "h"))
vim.keymap.set("n", "\\i", vim.get_hof(toggle_terminal, "i"))
vim.keymap.set("n", "\\j", vim.get_hof(toggle_terminal, "j"))
vim.keymap.set("n", "\\k", vim.get_hof(toggle_terminal, "k"))
vim.keymap.set("n", "\\l", vim.get_hof(toggle_terminal, "l"))
vim.keymap.set("n", "\\m", vim.get_hof(toggle_terminal, "m"))
vim.keymap.set("n", "\\n", vim.get_hof(toggle_terminal, "n"))
vim.keymap.set("n", "\\o", vim.get_hof(toggle_terminal, "o"))
vim.keymap.set("n", "\\p", vim.get_hof(toggle_terminal, "p"))
vim.keymap.set("n", "\\q", vim.get_hof(toggle_terminal, "q"))
vim.keymap.set("n", "\\r", vim.get_hof(toggle_terminal, "r"))
vim.keymap.set("n", "\\s", vim.get_hof(toggle_terminal, "s"))
vim.keymap.set("n", "\\t", vim.get_hof(toggle_terminal, "t"))
vim.keymap.set("n", "\\u", vim.get_hof(toggle_terminal, "u"))
vim.keymap.set("n", "\\v", vim.get_hof(toggle_terminal, "v"))
vim.keymap.set("n", "\\w", vim.get_hof(toggle_terminal, "w"))
vim.keymap.set("n", "\\x", vim.get_hof(toggle_terminal, "x"))
vim.keymap.set("n", "\\y", vim.get_hof(toggle_terminal, "y"))
vim.keymap.set("n", "\\z", vim.get_hof(toggle_terminal, "z"))

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
  defaults = vim.tbl_deep_extend("force", themes.get_dropdown(), {
    prompt_prefix = _G.icons.ui.Search .. " ",
    multi_icon = _G.icons.ui.Tag .. " ",
    selection_caret = _G.icons.ui.Caret .. " ",
  }),
})

vim.keymap.set("n", "<leader>fh", vim.get_hof(builtin.help_tags))
vim.keymap.set("n", "<leader>fr", vim.get_hof(builtin.oldfiles))
vim.keymap.set("n", "<leader>ff", vim.get_hof(builtin.find_files))
vim.keymap.set("n", "<leader>fa", vim.get_hof(builtin.filetypes))
vim.keymap.set("n", "<leader>fw", vim.get_hof(builtin.live_grep))
vim.keymap.set("n", "<leader>fs", vim.get_hof(builtin.lsp_document_symbols))

harpoon.setup({
  save_on_toggle = true,
  save_on_change = false,
})

vim.keymap.set("n", "<tab>", vim.get_hof(ui.toggle_quick_menu))
vim.keymap.set("n", "<c-m>", vim.get_hof(mark.add_file))
