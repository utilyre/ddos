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

vim.keymap.set("n", "<leader>pp", vim.callback(lazy.home))
vim.keymap.set("n", "<leader>pi", vim.callback(lazy.install))
vim.keymap.set("n", "<leader>pu", vim.callback(lazy.update))
vim.keymap.set("n", "<leader>ps", vim.callback(lazy.sync))
vim.keymap.set("n", "<leader>pc", vim.callback(lazy.clean))
