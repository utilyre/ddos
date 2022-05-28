local project = require("project_nvim")
local dressing = require("dressing")
local telescope = require("telescope")
local builtin = require("telescope.builtin")
local themes = require("telescope.themes")
local todo = require("todo-comments")
local whichkey = require("which-key")

project.setup({
  manual_mode = true,
})

dressing.setup({
  input = {
    enabled = true,
    relative = "editor",
    border = "rounded",
    winblend = 0,
    insert_only = false,
  },
  select = {
    enabled = true,
    telescope = themes.get_dropdown(),
  },
})

telescope.load_extension("projects")
telescope.setup({
  defaults = themes.get_dropdown(),
})

todo.setup({
  keywords = {
    FIX = { icon = vim.g.symbols.diagnostic.Fix },
    TODO = { icon = vim.g.symbols.diagnostic.Todo },
    HACK = { icon = vim.g.symbols.diagnostic.Hack },
    WARN = { icon = vim.g.symbols.diagnostic.Warn },
    PERF = { icon = vim.g.symbols.diagnostic.Perf },
    NOTE = { icon = vim.g.symbols.diagnostic.Note },
  },
})

whichkey.register({
  f = {
    name = "Find",
    p = { telescope.extensions.projects.projects, "Project" },
    b = { builtin.git_branches, "Branch" },
    r = { builtin.oldfiles, "Recent" },
    f = { builtin.find_files, "File" },
    a = { builtin.filetypes, "Association" },
    w = { builtin.live_grep, "Word" },
    t = { "<cmd>TodoTelescope<cr>", "Todo" },
    h = { builtin.help_tags, "Help" },
  },
}, { prefix = "<leader>" })
