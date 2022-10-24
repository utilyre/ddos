local mason = require("mason")
local ui = require("mason.ui")

mason.setup({
  max_concurrent_installers = 4,
  ui = {
    border = "rounded",
    icons = {
      package_pending = vim.g.icons.package.Pending,
      package_uninstalled = vim.g.icons.package.Uninstalled,
      package_installed = vim.g.icons.package.Installed,
    },
  },
})

vim.keymap.set("n", "<leader>m", vim.callback(ui.open))
