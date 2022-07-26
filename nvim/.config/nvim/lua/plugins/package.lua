local packer = require("packer")
local util = require("packer.util")
local mason = require("mason")
local lspconfig = require("mason-lspconfig")

packer.init({
  display = {
    open_fn = vim.get_hof(util.float, { border = "rounded" }),
  },
})

packer.startup({
  function(use)
    for i, plugin in ipairs(_G.plugins) do
      use(plugin)
    end
  end,
})

mason.setup({
  ui = {
    border = "rounded",
    icons = {
     package_pending = _G.icons.ui.Pending,
     package_uninstalled = _G.icons.ui.Unchecked,
     package_installed = _G.icons.ui.Checked,
    },
  },
})

lspconfig.setup({
  automatic_installation = true,
})

vim.keymap.set("n", "<leader>pi", vim.get_hof(packer.install))
vim.keymap.set("n", "<leader>pu", vim.get_hof(packer.update))
vim.keymap.set("n", "<leader>pc", vim.get_hof(packer.clean))
vim.keymap.set("n", "<leader>pt", "<cmd>Mason<cr>")
