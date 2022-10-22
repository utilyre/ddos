local fidget = require("fidget")

fidget.setup({
  align = {
    bottom = false,
  },
  timer = {
    spinner_rate = 60,
  },
  fmt = {
    stack_upwards = false,
    task = function(name, percentage, percent)
      local progress = percent and percent .. "%" or percentage
      return (name or "") .. " (" .. progress .. ")"
    end,
  },
  text = {
    spinner = "arc",
    done = vim.g.icons.package.Ready,
    commenced = "begun",
    completed = "done",
  },
})
