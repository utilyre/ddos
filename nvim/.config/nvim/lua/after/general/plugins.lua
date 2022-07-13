local install_path = vim.fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
if vim.fn.empty(vim.fn.glob(install_path)) == 1 then
  vim.fn.system({ "git", "clone", "--depth=1", "https://github.com/wbthomason/packer.nvim.git", install_path })
end

vim.g.plugins = {
  "wbthomason/packer.nvim",

  "nvim-lua/plenary.nvim",
  "nvim-lua/popup.nvim",
  "kyazdani42/nvim-web-devicons",
  "navarasu/onedark.nvim",

  "nvim-treesitter/nvim-treesitter",
  "p00f/nvim-ts-rainbow",
  "lukas-reineke/indent-blankline.nvim",
  "numtostr/comment.nvim",

  "neovim/nvim-lspconfig",
  "williamboman/nvim-lsp-installer",
  "jose-elias-alvarez/null-ls.nvim",

  "l3mon4d3/luasnip",
  "utilyre/spoon.nvim",

  "hrsh7th/nvim-cmp",
  "saadparwaiz1/cmp_luasnip",
  "hrsh7th/cmp-nvim-lsp",
  "hrsh7th/cmp-buffer",
  "f3fora/cmp-spell",
  "windwp/nvim-autopairs",

  "ahmedkhalf/project.nvim",
  "stevearc/dressing.nvim",
  "nvim-telescope/telescope.nvim",
  "folke/todo-comments.nvim",

  "lewis6991/gitsigns.nvim",
  "akinsho/git-conflict.nvim",

  "kyazdani42/nvim-tree.lua",
  "toppair/reach.nvim",
  "numtostr/fterm.nvim",

  "smiteshp/nvim-navic",
  "rcarriga/nvim-notify",
  "nvim-lualine/lualine.nvim",
}
