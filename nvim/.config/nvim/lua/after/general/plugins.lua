local install_path = vim.fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
  vim.fn.system({ "git", "clone", "--depth=1", "https://github.com/wbthomason/packer.nvim.git", install_path })
end

local packer = require("packer")
local util = require("packer.util")

packer.init({
  display = {
    open_fn = function()
      return util.float({ border = "single" })
    end,
  },
})

packer.startup(function(use)
  use("wbthomason/packer.nvim")

  use("famiu/bufdelete.nvim")
  use("nvim-lua/plenary.nvim")
  use("kyazdani42/nvim-web-devicons")
  use("navarasu/onedark.nvim")

  use("neovim/nvim-lspconfig")
  use("williamboman/nvim-lsp-installer")
  use("l3mon4d3/luasnip")
  use("rafamadriz/friendly-snippets")

  use("hrsh7th/nvim-cmp")
  use("saadparwaiz1/cmp_luasnip")
  use("hrsh7th/cmp-nvim-lsp")
  use("hrsh7th/cmp-buffer")

  use("nvim-treesitter/nvim-treesitter")
  use("p00f/nvim-ts-rainbow")
  use("windwp/nvim-ts-autotag")
  use("joosepalviste/nvim-ts-context-commentstring")

  use("nvim-telescope/telescope.nvim")
  use("kyazdani42/nvim-tree.lua")
  use("akinsho/toggleterm.nvim")
  use("folke/which-key.nvim")
  use("akinsho/bufferline.nvim")
  use("nvim-lualine/lualine.nvim")
  use("lewis6991/gitsigns.nvim")
  use("lukas-reineke/indent-blankline.nvim")
  use("folke/zen-mode.nvim")
  use("windwp/nvim-autopairs")
  use("numtostr/comment.nvim")
end)
