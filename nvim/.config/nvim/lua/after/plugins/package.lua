local packer = require("packer")
local util = require("packer.util")

packer.init({
  display = {
    open_fn = vim.get_hof(util.float, { border = "rounded" }),
  },
})

packer.startup({
  function(use)
    for _, plugin in pairs(vim.g.plugins) do
      use(plugin)
    end
  end,
})

vim.keymap.set("n", "<leader>pi", vim.get_hof(packer.install))
vim.keymap.set("n", "<leader>pu", vim.get_hof(packer.update))
vim.keymap.set("n", "<leader>pc", vim.get_hof(packer.clean))
