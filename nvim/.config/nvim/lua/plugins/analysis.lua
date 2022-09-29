local gitsigns = require("gitsigns")
local treesitter = require("nvim-treesitter.configs")
local indentblankline = require("indent_blankline")
local autopairs = require("nvim-autopairs")
local comment = require("Comment")

gitsigns.setup({
  preview_config = {
    border = "rounded",
  },
  on_attach = function(bufnr)
    vim.keymap.set("n", "<leader>gd", vim.get_hof(gitsigns.diffthis), { buffer = bufnr })
    vim.keymap.set("n", "<leader>gp", vim.get_hof(gitsigns.preview_hunk), { buffer = bufnr })
    vim.keymap.set("n", "<leader>gr", vim.get_hof(gitsigns.reset_hunk), { buffer = bufnr })
    vim.keymap.set("n", "<leader>gR", vim.get_hof(gitsigns.reset_buffer), { buffer = bufnr })
    vim.keymap.set("n", "<leader>ga", vim.get_hof(gitsigns.stage_hunk), { buffer = bufnr })
    vim.keymap.set("n", "<leader>gA", vim.get_hof(gitsigns.stage_buffer), { buffer = bufnr })
    vim.keymap.set("n", "<leader>gu", vim.get_hof(gitsigns.undo_stage_hunk), { buffer = bufnr })
    vim.keymap.set("n", "<leader>gk", vim.get_hof(gitsigns.prev_hunk), { buffer = bufnr })
    vim.keymap.set("n", "<leader>gj", vim.get_hof(gitsigns.next_hunk), { buffer = bufnr })
  end,
})

treesitter.setup({
  ensure_installed = "all",
  highlight = {
    enable = true,
  },
  rainbow = {
    enable = true,
  },
  indent = {
    enable = true,
  },
  autotag = {
    enable = true,
  },
})

indentblankline.setup({
  show_current_context = true,
  show_trailing_blankline_indent = false,
})

autopairs.setup({
  check_ts = true,
})

comment.setup({
  mappings = {
    basic = true,
    extra = true,
    extended = true,
  },
})
