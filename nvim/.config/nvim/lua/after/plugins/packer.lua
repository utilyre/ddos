local packer = require("packer")
local util = require("packer.util")

packer.init({
  display = {
    open_fn = function() return util.float({ border = "single" }) end,
  },
})

packer.startup(function()
  for _, plugin in pairs(_G.plugins) do
    packer.use(plugin)
  end
end)
