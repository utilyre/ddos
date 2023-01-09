local spec = {
  "folke/todo-comments.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
  },
}

function spec.config()
  local todo = require("todo-comments")
  local telescope = require("telescope")

  todo.setup({
    colors = {
      hint = { "TodoCommentsNote" },
      info = { "TodoCommentsTodo" },
      warning = { "TodoCommentsWarn" },
      error = { "TodoCommentsBug" },
      test = { "TodoCommentsTest" },
      default = { "TodoCommentsPerf" },
    },
    keywords = {
      NOTE = {
        icon = vim.g.icons.widget.Note,
      },
      TODO = {
        icon = vim.g.icons.widget.Check,
      },
      HACK = {
        icon = vim.g.icons.widget.Fire,
      },
      WARN = {
        icon = vim.g.icons.diagnostic.Warn,
      },
      FIX = {
        icon = vim.g.icons.diagnostic.Error,
      },
      TEST = {
        icon = vim.g.icons.widget.Filter,
      },
      PERF = {
        icon = vim.g.icons.widget.Hourglass,
      },
    },
  })

  vim.keymap.set("n", "<leader>ft", vim.callback(telescope.extensions["todo-comments"].todo))
  vim.keymap.set("n", "<leader>tk", vim.callback(todo.jump_prev))
  vim.keymap.set("n", "<leader>tj", vim.callback(todo.jump_next))
end

return spec
