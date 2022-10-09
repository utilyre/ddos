local mason = require("mason")
local ui = require("mason.ui")

mason.setup({
  max_concurrent_installers = 4,
  ui = {
    border = "rounded",
    icons = {
      package_pending = vim.g.icons.ui.Pending,
      package_uninstalled = vim.g.icons.ui.Uninstalled,
      package_installed = vim.g.icons.ui.Installed,
    },
  },
})

vim.keymap.set("n", "<leader>m", vim.fun_lambda(ui.open))
