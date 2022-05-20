local project = require("project_nvim")
local dressing = require("dressing")
local telescope = require("telescope")
local builtin = require("telescope.builtin")
local themes = require("telescope.themes")
local whichkey = require("which-key")

project.setup({
  silent_chdir = false,
})

dressing.setup({
  input = {
    enabled = true,
    relative = "editor",
    border = "single",
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

whichkey.register({
  f = {
    name = "Find",
    p = { telescope.extensions.projects.projects, "Project" },
    r = { builtin.oldfiles, "Recent" },
    f = { builtin.find_files, "File" },
    w = { builtin.live_grep, "Word" },
  },
}, { prefix = "<leader>" })
