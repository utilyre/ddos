local packer = require("packer")
local util = require("packer.util")

packer.init({
  display = {
    open_fn = vim.api.nvim_create_hof(util.float, { border = "rounded" }),
  },
})

packer.startup({
  function(use)
    for _, plugin in pairs(vim.g.plugins) do
      use(plugin)
    end
  end,
})

vim.keymap.set("n", "<leader>ps", vim.api.nvim_create_hof(packer.sync))
vim.keymap.set("n", "<leader>pi", vim.api.nvim_create_hof(packer.install))
vim.keymap.set("n", "<leader>pu", vim.api.nvim_create_hof(packer.update))
vim.keymap.set("n", "<leader>pc", vim.api.nvim_create_hof(packer.clean))
