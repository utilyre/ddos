local install_path = vim.fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
  vim.fn.system({ "git", "clone", "--depth=1", "https://github.com/wbthomason/packer.nvim.git", install_path })
end

_G.plugins = {
  "wbthomason/packer.nvim",

  "famiu/bufdelete.nvim",
  "nvim-lua/plenary.nvim",
  "kyazdani42/nvim-web-devicons",
  "navarasu/onedark.nvim",

  "neovim/nvim-lspconfig",
  "williamboman/nvim-lsp-installer",
  "l3mon4d3/luasnip",
  "rafamadriz/friendly-snippets",

  "hrsh7th/nvim-cmp",
  "saadparwaiz1/cmp_luasnip",
  "hrsh7th/cmp-nvim-lsp",
  "hrsh7th/cmp-buffer",

  "nvim-treesitter/nvim-treesitter",
  "p00f/nvim-ts-rainbow",
  "windwp/nvim-ts-autotag",
  "joosepalviste/nvim-ts-context-commentstring",

  "nvim-telescope/telescope.nvim",
  "kyazdani42/nvim-tree.lua",
  "akinsho/toggleterm.nvim",
  "folke/which-key.nvim",
  "akinsho/bufferline.nvim",
  "nvim-lualine/lualine.nvim",
  "lewis6991/gitsigns.nvim",
  "lukas-reineke/indent-blankline.nvim",
  "folke/zen-mode.nvim",
  "windwp/nvim-autopairs",
  "numtostr/comment.nvim",
}
