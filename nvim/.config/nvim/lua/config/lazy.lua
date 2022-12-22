local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_access(lazypath, "R") then
  os.execute(
    "git clone --single-branch --filter=\"blob:none\" -- \"https://github.com/folke/lazy.nvim.git\" \""
      .. lazypath
      .. "\""
  )
end
vim.opt.runtimepath:prepend(lazypath)

local lazy = require("lazy")

lazy.setup("config.plugins", {
  concurrency = 4,
  ui = {
    border = "rounded",
    icons = {
      cmd = " ",
      config = "",
      event = "",
      ft = " ",
      init = " ",
      keys = " ",
      plugin = " ",
      runtime = " ",
      source = " ",
      start = "",
      task = "✔ ",
    },
  },
})

vim.keymap.set("n", "<leader>p", vim.callback(lazy.home))
