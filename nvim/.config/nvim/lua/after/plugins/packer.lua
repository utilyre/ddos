local packer = require("packer")
local util = require("packer.util")
local whichkey = require("which-key")

packer.init({
  display = {
    open_fn = F(util.float, { border = "rounded" }),
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
    s = { F(packer.sync), "Sync" },
    i = { F(packer.install), "Install" },
    u = { F(packer.update), "Update" },
    c = { F(packer.clean), "Clean" },
  },
}, { prefix = "<leader>" })
