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

lazy.setup({
  { "nvim-lua/plenary.nvim" },
  { "muniftanjim/nui.nvim" },

  {
    "kyazdani42/nvim-web-devicons",
    config = function()
      require("config.plugins.devicons")
    end,
  },
  {
    "folke/tokyonight.nvim",
    config = function()
      require("config.plugins.tokyonight")
    end,
  },

  {
    "folke/noice.nvim",
    dependencies = {
      { "rcarriga/nvim-notify" },
    },
    config = function()
      require("config.plugins.notify")
      require("config.plugins.noice")
    end,
  },

  {
    "numtostr/fterm.nvim",
    config = function()
      require("config.plugins.fterm")
    end,
  },
  {
    "kyazdani42/nvim-tree.lua",
    config = function()
      require("config.plugins.tree")
    end,
  },
  {
    "nvim-telescope/telescope.nvim",
    config = function()
      require("config.plugins.telescope")
    end,
  },
  {
    "theprimeagen/harpoon",
    config = function()
      require("config.plugins.harpoon")
    end,
  },

  {
    "utilyre/barbecue.nvim",
    dependencies = {
      { "smiteshp/nvim-navic" },
    },
    config = function()
      require("config.plugins.barbecue")
    end,
  },
  {
    "lewis6991/satellite.nvim",
    config = function()
      require("config.plugins.satellite")
    end,
  },
  {
    "nvim-lualine/lualine.nvim",
    dependencies = {
      { "folke/tokyonight.nvim" },
    },
    config = function()
      require("config.plugins.lualine")
    end,
  },

  {
    "rrethy/vim-illuminate",
    config = function()
      require("config.plugins.illuminate")
    end,
  },
  {
    "lvimuser/lsp-inlayhints.nvim",
    config = function()
      require("config.plugins.inlayhints")
    end,
  },
  {
    "lukas-reineke/indent-blankline.nvim",
    config = function()
      require("config.plugins.blankline")
    end,
  },
  {
    "lewis6991/gitsigns.nvim",
    config = function()
      require("config.plugins.gitsigns")
    end,
  },
  {
    "numtostr/comment.nvim",
    config = function()
      require("config.plugins.comment")
    end,
  },

  {
    "nvim-treesitter/nvim-treesitter",
    dependencies = {
      { "p00f/nvim-ts-rainbow" },
    },
    config = function()
      require("config.plugins.treesitter")
    end,
  },

  {
    "l3mon4d3/luasnip",
    dependencies = {
      { "rafamadriz/friendly-snippets" },
    },
    config = function()
      require("config.plugins.luasnip")
    end,
  },

  {
    "williamboman/mason.nvim",
    config = function()
      require("config.plugins.mason")
    end,
  },
  {
    url = "https://git.sr.ht/~whynothugo/lsp_lines.nvim",
    config = function()
      require("config.plugins.diagnostic")
    end,
  },
  {
    "neovim/nvim-lspconfig",
    config = function()
      require("config.plugins.lsp")
    end,
  },
  {
    "jose-elias-alvarez/null-ls.nvim",
    config = function()
      require("config.plugins.null")
    end,
  },

  {
    "hrsh7th/nvim-cmp",
    dependencies = {
      { "saadparwaiz1/cmp_luasnip" },
      { "hrsh7th/cmp-nvim-lsp" },
      { "petertriho/cmp-git" },
      { "hrsh7th/cmp-emoji" },
    },
    config = function()
      require("config.plugins.cmp")
    end,
  },
})
