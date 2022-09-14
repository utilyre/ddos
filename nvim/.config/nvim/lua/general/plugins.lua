local packer_path = vim.fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
if vim.fn.empty(vim.fn.glob(packer_path)) == 1 then
  vim.fn.system({ "git", "clone", "--depth=1", "https://github.com/wbthomason/packer.nvim.git", packer_path })
end
local mason_path = vim.fn.stdpath("data") .. "/site/pack/packer/start/mason.nvim"
if vim.fn.empty(vim.fn.glob(mason_path)) == 1 then
  vim.fn.system({ "git", "clone", "--depth=1", "https://github.com/williamboman/mason.nvim.git", mason_path })
end

_G.plugins = {
  "wbthomason/packer.nvim",
  "williamboman/mason.nvim",

  "kyazdani42/nvim-web-devicons",
  "folke/tokyonight.nvim",

  "nvim-lua/plenary.nvim",
  "nvim-lua/popup.nvim",
  "rcarriga/nvim-notify",
  "stevearc/dressing.nvim",
  "lewis6991/gitsigns.nvim",
  "lukas-reineke/indent-blankline.nvim",
  "windwp/nvim-autopairs",
  "numtostr/comment.nvim",
  "numtostr/fterm.nvim",

  "kyazdani42/nvim-tree.lua",
  "nvim-telescope/telescope.nvim",

  "akinsho/bufferline.nvim",
  "utilyre/barbecue.nvim",
  "nvim-lualine/lualine.nvim",

  "nvim-treesitter/nvim-treesitter",
  "p00f/nvim-ts-rainbow",
  "windwp/nvim-ts-autotag",
  "folke/twilight.nvim",

  "l3mon4d3/luasnip",
  "rafamadriz/friendly-snippets",

  "https://git.sr.ht/~whynothugo/lsp_lines.nvim",
  "neovim/nvim-lspconfig",
  "jose-elias-alvarez/null-ls.nvim",
  "smiteshp/nvim-navic",
  "rrethy/vim-illuminate",

  "hrsh7th/nvim-cmp",
  "saadparwaiz1/cmp_luasnip",
  "hrsh7th/cmp-nvim-lsp",
  "hrsh7th/cmp-buffer",
}
