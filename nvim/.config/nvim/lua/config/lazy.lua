local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.fs.exists(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--single-branch",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    lazypath,
  })
end
vim.opt.runtimepath:prepend(lazypath)

local lazy = require("lazy")

lazy.setup("config.plugins", {
  concurrency = 4,
  install = {
    colorscheme = { "tokyonight", "habamax" },
  },
  dev = {
    path = vim.fs.normalize("$XDG_DOCUMENTS_HOME"),
  },
  ui = {
    border = "rounded",
    icons = {
      not_loaded = vim.g.icons.widget.outline.Circle,
      loaded = vim.g.icons.widget.inline.Circle,
      task = vim.g.icons.widget.inline.Clipboard,
      source = vim.g.icons.widget.inline.Fire,
      start = vim.g.icons.widget.inline.Play,
      plugin = vim.g.icons.widget.inline.Archive,
      event = vim.g.icons.widget.inline.Bolt,
      keys = vim.g.icons.widget.outline.Keyboard,
      cmd = vim.g.icons.widget.inline.Usd,
      ft = vim.g.icons.widget.inline.Code,
      init = vim.g.icons.widget.inline.Flask,
      runtime = vim.g.icons.widget.inline.Vim,
      import = vim.g.icons.widget.inline.PaperClip,
      config = vim.g.icons.widget.inline.Gear,
    },
  },
})

local function map(left, right) vim.keymap.set("n", "<leader>p" .. left, right) end

map("h", vim.callback(lazy.home))
map("i", vim.callback(lazy.install))
map("u", vim.callback(lazy.update))
map("s", vim.callback(lazy.sync))
map("x", vim.callback(lazy.clean))
map("c", vim.callback(lazy.check))
map("l", vim.callback(lazy.log))
map("r", vim.callback(lazy.restore))
map("p", vim.callback(lazy.profile))
map("d", vim.callback(lazy.debug))
