local packer = require("packer")
local util = require("packer.util")

packer.startup({
  {
    "nvim-lua/plenary.nvim",
    "nvim-lua/popup.nvim",

    vim.pkg_use("wbthomason/packer.nvim"),

    {
      "williamboman/mason.nvim",
      config = function()
        require("config.plugins.mason")
      end,
    },

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
      "rcarriga/nvim-notify",
      config = function()
        require("config.plugins.notify")
      end,
    },

    {
      "stevearc/dressing.nvim",
      config = function()
        require("config.plugins.dressing")
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
      requires = {
        "smiteshp/nvim-navic",
        "theprimeagen/harpoon",
      },
      config = function()
        require("config.plugins.barbecue")
      end,
    },

    {
      "j-hui/fidget.nvim",
      config = function()
        require("config.plugins.fidget")
      end,
    },

    {
      "nvim-lualine/lualine.nvim",
      requires = {
        "jose-elias-alvarez/null-ls.nvim",
      },
      config = function()
        require("config.plugins.lualine")
      end,
    },

    {
      "lewis6991/gitsigns.nvim",
      config = function()
        require("config.plugins.gitsigns")
      end,
    },

    {
      "nvim-treesitter/nvim-treesitter",
      requires = {
        "p00f/nvim-ts-rainbow",
        "windwp/nvim-ts-autotag",
      },
      config = function()
        require("config.plugins.treesitter")
      end,
    },

    {
      "lukas-reineke/indent-blankline.nvim",
      config = function()
        require("config.plugins.blankline")
      end,
    },

    {
      "windwp/nvim-autopairs",
      config = function()
        require("config.plugins.autopairs")
      end,
    },

    {
      "numtostr/comment.nvim",
      config = function()
        require("config.plugins.comment")
      end,
    },

    {
      "l3mon4d3/luasnip",
      requires = {
        "rafamadriz/friendly-snippets",
      },
      config = function()
        require("config.plugins.luasnip")
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
      requires = {
        "windwp/nvim-autopairs",
        "saadparwaiz1/cmp_luasnip",
        "hrsh7th/cmp-nvim-lsp",
        "petertriho/cmp-git",
        "hrsh7th/cmp-buffer",
      },
      config = function()
        require("config.plugins.cmp")
      end,
    },
  },
  config = {
    max_jobs = 4,
    display = {
      error_sym = _G.icons.ui.Pending,
      working_sym = _G.icons.ui.Pending,
      removed_sym = _G.icons.ui.Uninstalled,
      done_sym = _G.icons.ui.Installed,
      prompt_border = "rounded",
      open_fn = vim.fun_lambda(util.float, { border = "rounded" }),
    },
  },
})

vim.keymap.set("n", "<leader>pc", vim.fun_lambda(packer.clean))
vim.keymap.set("n", "<leader>pi", vim.fun_lambda(packer.install))
vim.keymap.set("n", "<leader>pu", vim.fun_lambda(packer.update))
