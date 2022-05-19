local install_path = vim.fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
if vim.fn.empty(install_path) == 1 then
  vim.fn.system({ "git", "clone", "--depth=1", "https://github.com/wbthomason/packer.nvim.git", install_path })
end

_G.plugins = {
  "wbthomason/packer.nvim",

  "nvim-lua/plenary.nvim",
  "nvim-lua/popup.nvim",
  "kyazdani42/nvim-web-devicons",
  "navarasu/onedark.nvim",

  "nvim-treesitter/nvim-treesitter",
  "p00f/nvim-ts-rainbow",
  "windwp/nvim-ts-autotag",

  "neovim/nvim-lspconfig",
  "williamboman/nvim-lsp-installer",
  "jose-elias-alvarez/null-ls.nvim",

  "l3mon4d3/luasnip",
  "rafamadriz/friendly-snippets",

  "hrsh7th/nvim-cmp",
  "saadparwaiz1/cmp_luasnip",
  "hrsh7th/cmp-nvim-lsp",
  "hrsh7th/cmp-buffer",

  "ahmedkhalf/project.nvim",
  "stevearc/dressing.nvim",
  "nvim-telescope/telescope.nvim",

  "kyazdani42/nvim-tree.lua",
  "akinsho/toggleterm.nvim",
  "folke/which-key.nvim",

  "romgrk/barbar.nvim",
  "petertriho/nvim-scrollbar",
  "nvim-lualine/lualine.nvim",
  "lewis6991/gitsigns.nvim",
  "lukas-reineke/indent-blankline.nvim",

  "windwp/nvim-autopairs",
  "numtostr/comment.nvim",
}
