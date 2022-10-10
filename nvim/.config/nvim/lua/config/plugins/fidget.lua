local fidget = require("fidget")

fidget.setup({
  window = {
    zindex = 1,
  },
  align = {
    bottom = false,
  },
  fmt = {
    stack_upwards = false,
    task = function(name, message, percent)
      local progress = percent and percent .. "%" or message
      return (name or "") .. " (" .. (progress or "") .. ")"
    end,
  },
  text = {
    spinner = "arc",
    done = vim.g.icons.package.Ready,
  },
})
