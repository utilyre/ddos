local fidget = require("fidget")

fidget.setup({
  window = {
    zindex = 1,
  },
  align = {
    bottom = false,
  },
  timer = {
    spinner_rate = 60,
  },
  fmt = {
    stack_upwards = false,
    task = function(name, message, percent)
      local percentage = percent and percent .. "%" or message
      return (name or "") .. " (" .. (percentage or "") .. ")"
    end,
  },
  text = {
    spinner = "arc",
    done = vim.g.icons.package.Ready,
  },
})
