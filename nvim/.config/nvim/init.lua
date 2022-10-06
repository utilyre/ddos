require("general.icons")
require("general.utils")
require("general.keymaps")
require("general.options")

_G.plugins = {
  "nvim-lua/plenary.nvim",
  "nvim-lua/popup.nvim",

  vim.pkg_use({
    "wbthomason/packer.nvim",
    config = function()
      require("plugins.packer")
    end,
  }),

  {
    "williamboman/mason.nvim",
    config = function()
      require("plugins.mason")
    end,
  },

  {
    "kyazdani42/nvim-web-devicons",
    config = function()
      require("plugins.devicons")
    end,
  },

  {
    "folke/tokyonight.nvim",
    config = function()
      require("plugins.tokyonight")
    end,
  },

  {
    "rcarriga/nvim-notify",
    config = function()
      require("plugins.notify")
    end,
  },

  {
    "stevearc/dressing.nvim",
    config = function()
      require("plugins.dressing")
    end,
  },

  {
    "numtostr/fterm.nvim",
    config = function()
      require("plugins.fterm")
    end,
  },

  {
    "kyazdani42/nvim-tree.lua",
    config = function()
      require("plugins.tree")
    end,
  },

  {
    "nvim-telescope/telescope.nvim",
    config = function()
      require("plugins.telescope")
    end,
  },

  {
    "theprimeagen/harpoon",
    config = function()
      require("plugins.harpoon")
    end,
  },

  {
    "utilyre/barbecue.nvim",
    requires = {
      "smiteshp/nvim-navic",
      "theprimeagen/harpoon",
    },
    config = function()
      require("plugins.barbecue")
    end,
  },

  {
    "j-hui/fidget.nvim",
    config = function()
      require("plugins.fidget")
    end,
  },

  {
    "nvim-lualine/lualine.nvim",
    requires = {
      "jose-elias-alvarez/null-ls.nvim",
    },
    config = function()
      require("plugins.lualine")
    end,
  },

  {
    "lewis6991/gitsigns.nvim",
    config = function()
      require("plugins.gitsigns")
    end,
  },

  {
    "nvim-treesitter/nvim-treesitter",
    requires = {
      "p00f/nvim-ts-rainbow",
      "windwp/nvim-ts-autotag",
    },
    config = function()
      require("plugins.treesitter")
    end,
  },

  {
    "lukas-reineke/indent-blankline.nvim",
    config = function()
      require("plugins.blankline")
    end,
  },

  {
    "windwp/nvim-autopairs",
    config = function()
      require("plugins.autopairs")
    end,
  },

  {
    "numtostr/comment.nvim",
    config = function()
      require("plugins.comment")
    end,
  },

  {
    "l3mon4d3/luasnip",
    requires = {
      "rafamadriz/friendly-snippets",
    },
    config = function()
      require("plugins.luasnip")
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
      require("plugins.lsp")
    end,
  },

  {
    "jose-elias-alvarez/null-ls.nvim",
    config = function()
      require("plugins.null")
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
      require("plugins.cmp")
    end,
  },
}
