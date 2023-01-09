local spec = {
  "rcarriga/nvim-notify",
}

function spec.config()
  local notify = require("notify")

  notify.setup({
    stages = "fade",
    top_down = false,
    icons = {
      INFO = vim.g.icons.widget.Info,
      WARN = vim.g.icons.widget.Warn,
      ERROR = vim.g.icons.widget.Error,
    },
  })
end

return spec
