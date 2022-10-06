local mason = require("mason")
local ui = require("mason.ui")

mason.setup({
  max_concurrent_installers = 4,
  ui = {
    border = "rounded",
    icons = {
      package_pending = _G.icons.ui.Pending,
      package_uninstalled = _G.icons.ui.Uninstalled,
      package_installed = _G.icons.ui.Installed,
    },
  },
})

vim.keymap.set("n", "<leader>m", vim.fun_lambda(ui.open))
