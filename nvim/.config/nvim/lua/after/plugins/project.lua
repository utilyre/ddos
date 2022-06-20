local project = require("project_nvim")
local dressing = require("dressing")
local telescope = require("telescope")
local builtin = require("telescope.builtin")
local themes = require("telescope.themes")
local todo = require("todo-comments")

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

vim.keymap.set("n", "<leader>fp", vim.api.nvim_create_hof(telescope.extensions.projects.projects))
vim.keymap.set("n", "<leader>fb", vim.api.nvim_create_hof(builtin.git_branches))
vim.keymap.set("n", "<leader>fr", vim.api.nvim_create_hof(builtin.oldfiles))
vim.keymap.set("n", "<leader>ff", vim.api.nvim_create_hof(builtin.find_files))
vim.keymap.set("n", "<leader>fa", vim.api.nvim_create_hof(builtin.filetypes))
vim.keymap.set("n", "<leader>fw", vim.api.nvim_create_hof(builtin.live_grep))
vim.keymap.set("n", "<leader>ft", vim.api.nvim_create_hof(telescope.extensions["todo-comments"].todo))
vim.keymap.set("n", "<leader>fh", vim.api.nvim_create_hof(builtin.help_tags))
