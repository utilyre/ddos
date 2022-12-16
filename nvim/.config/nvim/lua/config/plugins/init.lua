local packer_path = vim.fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
if not vim.loop.fs_access(packer_path, "R") then
  os.execute("git clone --depth=\"1\" -- \"https://github.com/wbthomason/packer.nvim.git\" \"" .. packer_path .. "\"")
  vim.cmd.packadd("packer.nvim")
end

local packer = require("packer")
local util = require("packer.util")

packer.startup({
  function(use)
    use({
      "wbthomason/packer.nvim",
      requires = {
        "nvim-lua/plenary.nvim",
        "muniftanjim/nui.nvim",

        "kyazdani42/nvim-web-devicons",
        "folke/tokyonight.nvim",

        "rcarriga/nvim-notify",
        "folke/noice.nvim",

        "rrethy/vim-illuminate",
        "lukas-reineke/indent-blankline.nvim",
        "lewis6991/gitsigns.nvim",
        "numtostr/comment.nvim",

        "numtostr/fterm.nvim",
        "kyazdani42/nvim-tree.lua",
        "nvim-telescope/telescope.nvim",
        "theprimeagen/harpoon",

        "smiteshp/nvim-navic",
        "utilyre/barbecue.nvim",
        "nvim-lualine/lualine.nvim",

        "nvim-treesitter/nvim-treesitter",
        "p00f/nvim-ts-rainbow",

        "l3mon4d3/luasnip",
        "rafamadriz/friendly-snippets",

        "williamboman/mason.nvim",
        "https://git.sr.ht/~whynothugo/lsp_lines.nvim",
        "neovim/nvim-lspconfig",
        "jose-elias-alvarez/null-ls.nvim",

        "hrsh7th/nvim-cmp",
        "saadparwaiz1/cmp_luasnip",
        "hrsh7th/cmp-nvim-lsp",
        "petertriho/cmp-git",
        "hrsh7th/cmp-emoji",
      },
      config = function()
        require("config.plugins.devicons")
        require("config.plugins.tokyonight")

        require("config.plugins.notify")
        require("config.plugins.noice")

        require("config.plugins.illuminate")
        require("config.plugins.blankline")
        require("config.plugins.gitsigns")
        require("config.plugins.comment")

        require("config.plugins.fterm")
        require("config.plugins.tree")
        require("config.plugins.telescope")
        require("config.plugins.harpoon")

        require("config.plugins.barbecue")
        require("config.plugins.lualine")

        require("config.plugins.treesitter")

        require("config.plugins.luasnip")

        require("config.plugins.mason")
        require("config.plugins.diagnostic")
        require("config.plugins.lsp")
        require("config.plugins.null")

        require("config.plugins.cmp")
      end,
    })
  end,
  config = {
    max_jobs = 4,
    display = {
      error_sym = vim.g.icons.package.Pending,
      working_sym = vim.g.icons.package.Pending,
      removed_sym = vim.g.icons.package.Uninstalled,
      done_sym = vim.g.icons.package.Installed,
      prompt_border = "rounded",
      open_fn = vim.callback(util.float, { border = "rounded" }),
    },
  },
})

vim.keymap.set("n", "<leader>pc", vim.callback(packer.clean))
vim.keymap.set("n", "<leader>pi", vim.callback(packer.install))
vim.keymap.set("n", "<leader>pu", vim.callback(packer.update))
vim.keymap.set("n", "<leader>ps", vim.callback(packer.sync))
