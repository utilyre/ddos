local spec = {
  "williamboman/mason.nvim",
}

function spec.config()
  local mason = require("mason")
  local ui = require("mason.ui")

  mason.setup({
    max_concurrent_installers = 4,
    ui = {
      check_outdated_packages_on_open = false,
      border = "rounded",
      icons = {
        package_uninstalled = vim.g.icons.widget.Archive,
        package_pending = vim.g.icons.widget.Download,
        package_installed = vim.g.icons.widget.Gear,
      },
    },
  })

  vim.keymap.set("n", "<leader>m", vim.callback(ui.open))
end

return spec
