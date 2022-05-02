local packer = require("packer")
local util = require("packer.util")
local whichkey = require("which-key")

packer.startup({
  function()
    for _, plugin in pairs(_G.plugins) do
      packer.use(plugin)
    end
  end,
  config = {
    display = {
      open_fn = function() return util.float({ border = "single" }) end,
    },
  },
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
