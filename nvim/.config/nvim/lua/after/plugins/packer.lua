local packer = require("packer")
local util = require("packer.util")
local whichkey = require("which-key")

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

whichkey.register({
  p = {
    name = "Plugin",
    s = { vim.api.nvim_create_hof(packer.sync), "Sync" },
    i = { vim.api.nvim_create_hof(packer.install), "Install" },
    u = { vim.api.nvim_create_hof(packer.update), "Update" },
    c = { vim.api.nvim_create_hof(packer.clean), "Clean" },
  },
}, { prefix = "<leader>" })
