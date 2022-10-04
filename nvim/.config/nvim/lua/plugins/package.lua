local packer = require("packer")
local util = require("packer.util")
local mason = require("mason")
local ui = require("mason.ui")

packer.startup({
  _G.plugins,
  config = {
    max_jobs = 4,
    display = {
      error_sym = _G.icons.ui.Pending,
      working_sym = _G.icons.ui.Pending,
      removed_sym = _G.icons.ui.Uninstalled,
      done_sym = _G.icons.ui.Installed,
      prompt_border = "rounded",
      open_fn = vim.fun_lambda(util.float, { border = "rounded" }),
    },
  },
})

vim.keymap.set("n", "<leader>pc", vim.fun_lambda(packer.clean))
vim.keymap.set("n", "<leader>pi", vim.fun_lambda(packer.install))
vim.keymap.set("n", "<leader>pu", vim.fun_lambda(packer.update))

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

vim.keymap.set("n", "<leader>pm", vim.fun_lambda(ui.open))
