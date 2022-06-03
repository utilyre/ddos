local packer = require("packer")
local util = require("packer.util")
local whichkey = require("which-key")

packer.init({
  display = {
    open_fn = vim.hof(util.float, { border = "rounded" }),
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
    s = { vim.hof(packer.sync), "Sync" },
    i = { vim.hof(packer.install), "Install" },
    u = { vim.hof(packer.update), "Update" },
    c = { vim.hof(packer.clean), "Clean" },
  },
}, { prefix = "<leader>" })
