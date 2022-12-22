local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
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
      task = vim.g.icons.widget.Task,
      source = vim.g.icons.widget.Fire,
      start = vim.g.icons.widget.Play,
      plugin = vim.g.icons.widget.Box,
      event = vim.g.icons.widget.Bolt,
      keys = vim.g.icons.widget.Keyboard,
      cmd = vim.g.icons.widget.Dollar,
      ft = vim.g.icons.widget.Code,
      init = vim.g.icons.widget.Flask,
      runtime = vim.g.icons.widget.Vim,
      config = vim.g.icons.widget.Gear,
    },
  },
})

vim.keymap.set("n", "<leader>pp", vim.callback(lazy.home))
vim.keymap.set("n", "<leader>pi", vim.callback(lazy.install))
vim.keymap.set("n", "<leader>pu", vim.callback(lazy.update))
vim.keymap.set("n", "<leader>ps", vim.callback(lazy.sync))
vim.keymap.set("n", "<leader>pc", vim.callback(lazy.clean))
