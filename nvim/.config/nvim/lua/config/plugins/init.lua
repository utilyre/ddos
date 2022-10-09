local packer_path = os.getenv("XDG_DATA_HOME") .. "/nvim/site/pack/packer/start/packer.nvim"
if not vim.fs.exists(packer_path) then
  os.execute("git clone --depth=\"1\" -- \"https://github.com/wbthomason/packer.nvim.git\" \"" .. packer_path .. "\"")
end

local packer = require("packer")
local util = require("packer.util")

packer.startup({
  function(use)
    use({
      "wbthomason/packer.nvim",
      requires = {
        "nvim-lua/plenary.nvim",
        "nvim-lua/popup.nvim",

        "kyazdani42/nvim-web-devicons",
        "folke/tokyonight.nvim",

        "rcarriga/nvim-notify",
        "stevearc/dressing.nvim",

        "lukas-reineke/indent-blankline.nvim",
        "lewis6991/gitsigns.nvim",
        "numtostr/comment.nvim",
        "windwp/nvim-autopairs",

        "numtostr/fterm.nvim",
        "kyazdani42/nvim-tree.lua",
        "nvim-telescope/telescope.nvim",
        "theprimeagen/harpoon",

        "utilyre/barbecue.nvim",
        "j-hui/fidget.nvim",
        "nvim-lualine/lualine.nvim",

        "nvim-treesitter/nvim-treesitter",
        "p00f/nvim-ts-rainbow",
        "windwp/nvim-ts-autotag",

        "l3mon4d3/luasnip",
        "rafamadriz/friendly-snippets",

        "williamboman/mason.nvim",
        "neovim/nvim-lspconfig",
        "jose-elias-alvarez/null-ls.nvim",
        "smiteshp/nvim-navic",
        "rrethy/vim-illuminate",

        "hrsh7th/nvim-cmp",
        "saadparwaiz1/cmp_luasnip",
        "hrsh7th/cmp-nvim-lsp",
        "petertriho/cmp-git",
        "hrsh7th/cmp-buffer",
      },
      config = function()
        require("config.plugins.devicons")
        require("config.plugins.tokyonight")

        require("config.plugins.notify")
        require("config.plugins.dressing")

        require("config.plugins.blankline")
        require("config.plugins.gitsigns")
        require("config.plugins.comment")
        require("config.plugins.autopairs")

        require("config.plugins.fterm")
        require("config.plugins.tree")
        require("config.plugins.telescope")
        require("config.plugins.harpoon")

        require("config.plugins.barbecue")
        require("config.plugins.fidget")
        require("config.plugins.lualine")

        require("config.plugins.treesitter")

        require("config.plugins.luasnip")

        require("config.plugins.mason")
        require("config.plugins.lsp")
        require("config.plugins.null")

        require("config.plugins.cmp")
      end,
    })
  end,
  config = {
    max_jobs = 4,
    display = {
      error_sym = vim.g.icons.ui.Pending,
      working_sym = vim.g.icons.ui.Pending,
      removed_sym = vim.g.icons.ui.Uninstalled,
      done_sym = vim.g.icons.ui.Installed,
      prompt_border = "rounded",
      open_fn = vim.fun_lambda(util.float, { border = "rounded" }),
    },
  },
})

vim.keymap.set("n", "<leader>pc", vim.fun_lambda(packer.clean))
vim.keymap.set("n", "<leader>pi", vim.fun_lambda(packer.install))
vim.keymap.set("n", "<leader>pu", vim.fun_lambda(packer.update))
vim.keymap.set("n", "<leader>ps", vim.fun_lambda(packer.sync))
