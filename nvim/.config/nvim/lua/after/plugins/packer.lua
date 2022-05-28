local packer = require("packer")
local util = require("packer.util")
local whichkey = require("which-key")

packer.init({
  display = {
    open_fn = function() return util.float({ border = "rounded" }) end,
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
    s = { packer.sync, "Sync" },
    i = { packer.install, "Install" },
    u = { packer.update, "Update" },
    c = { packer.clean, "Clean" },
  },
}, { prefix = "<leader>" })
