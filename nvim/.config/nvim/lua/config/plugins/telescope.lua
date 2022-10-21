local telescope = require("telescope")
local themes = require("telescope.themes")
local builtin = require("telescope.builtin")

telescope.setup({
  defaults = vim.tbl_deep_extend("force", themes.get_dropdown(), {
    prompt_prefix = vim.g.icons.widget.Search .. " ",
    selection_caret = vim.g.icons.widget.Caret .. " ",
    multi_icon = vim.g.icons.widget.Tag .. " ",
  }),
})

vim.keymap.set("n", "<leader>fh", vim.fun_lambda(builtin.help_tags))
vim.keymap.set("n", "<leader>fr", vim.fun_lambda(builtin.oldfiles))
vim.keymap.set("n", "<leader>ff", vim.fun_lambda(builtin.find_files))
vim.keymap.set("n", "<leader>fa", vim.fun_lambda(builtin.filetypes))
vim.keymap.set("n", "<leader>fw", vim.fun_lambda(builtin.live_grep))
