require("config.icons")
require("config.utils")
require("config.keymaps")
require("config.options")

_G.plugins = {
  "nvim-lua/plenary.nvim",
  "nvim-lua/popup.nvim",

  vim.pkg_use({
    "wbthomason/packer.nvim",
    config = function()
      require("config.packer")
    end,
  }),

  {
    "williamboman/mason.nvim",
    config = function()
      require("config.mason")
    end,
  },

  {
    "kyazdani42/nvim-web-devicons",
    config = function()
      require("config.devicons")
    end,
  },

  {
    "folke/tokyonight.nvim",
    config = function()
      require("config.tokyonight")
    end,
  },

  {
    "rcarriga/nvim-notify",
    config = function()
      require("config.notify")
    end,
  },

  {
    "stevearc/dressing.nvim",
    config = function()
      require("config.dressing")
    end,
  },

  {
    "numtostr/fterm.nvim",
    config = function()
      require("config.fterm")
    end,
  },

  {
    "kyazdani42/nvim-tree.lua",
    config = function()
      require("config.tree")
    end,
  },

  {
    "nvim-telescope/telescope.nvim",
    config = function()
      require("config.telescope")
    end,
  },

  {
    "theprimeagen/harpoon",
    config = function()
      require("config.harpoon")
    end,
  },

  {
    "utilyre/barbecue.nvim",
    requires = {
      "smiteshp/nvim-navic",
      "theprimeagen/harpoon",
    },
    config = function()
      require("config.barbecue")
    end,
  },

  {
    "j-hui/fidget.nvim",
    config = function()
      require("config.fidget")
    end,
  },

  {
    "nvim-lualine/lualine.nvim",
    requires = {
      "jose-elias-alvarez/null-ls.nvim",
    },
    config = function()
      require("config.lualine")
    end,
  },

  {
    "lewis6991/gitsigns.nvim",
    config = function()
      require("config.gitsigns")
    end,
  },

  {
    "nvim-treesitter/nvim-treesitter",
    requires = {
      "p00f/nvim-ts-rainbow",
      "windwp/nvim-ts-autotag",
    },
    config = function()
      require("config.treesitter")
    end,
  },

  {
    "lukas-reineke/indent-blankline.nvim",
    config = function()
      require("config.blankline")
    end,
  },

  {
    "windwp/nvim-autopairs",
    config = function()
      require("config.autopairs")
    end,
  },

  {
    "numtostr/comment.nvim",
    config = function()
      require("config.comment")
    end,
  },

  {
    "l3mon4d3/luasnip",
    requires = {
      "rafamadriz/friendly-snippets",
    },
    config = function()
      require("config.luasnip")
    end,
  },

  {
    "neovim/nvim-lspconfig",
    requires = {
      "hrsh7th/cmp-nvim-lsp",
      "smiteshp/nvim-navic",
      "rrethy/vim-illuminate",
    },
    config = function()
      require("config.lsp")
    end,
  },

  {
    "jose-elias-alvarez/null-ls.nvim",
    config = function()
      require("config.null")
    end,
  },

  {
    "hrsh7th/nvim-cmp",
    requires = {
      "windwp/nvim-autopairs",
      "saadparwaiz1/cmp_luasnip",
      "hrsh7th/cmp-nvim-lsp",
      "petertriho/cmp-git",
      "hrsh7th/cmp-buffer",
    },
    config = function()
      require("config.cmp")
    end,
  },
}
