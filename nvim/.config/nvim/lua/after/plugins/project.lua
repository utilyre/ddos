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
telescope.load_extension("todo-comments")
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
    p = { vim.api.nvim_create_hof(telescope.extensions.projects.projects), "Project" },
    b = { vim.api.nvim_create_hof(builtin.git_branches), "Branch" },
    r = { vim.api.nvim_create_hof(builtin.oldfiles), "Recent" },
    f = { vim.api.nvim_create_hof(builtin.find_files), "File" },
    a = { vim.api.nvim_create_hof(builtin.filetypes), "Association" },
    w = { vim.api.nvim_create_hof(builtin.live_grep), "Word" },
    t = { vim.api.nvim_create_hof(telescope.extensions["todo-comments"].todo), "Todo" },
    h = { vim.api.nvim_create_hof(builtin.help_tags), "Help" },
  },
}, { prefix = "<leader>" })
