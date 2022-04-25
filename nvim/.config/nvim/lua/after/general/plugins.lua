local install_path = vim.fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
  vim.fn.system({ "git", "clone", "--depth", "1", "https://github.com/wbthomason/packer.nvim", install_path })
end

require("packer").startup({
  function(use)
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
    use("lewis6991/gitsigns.nvim")
    use("akinsho/bufferline.nvim")
    use("petertriho/nvim-scrollbar")
    use("nvim-lualine/lualine.nvim")
    use("lukas-reineke/indent-blankline.nvim")
    use("norcalli/nvim-colorizer.lua")
    use("folke/zen-mode.nvim")
    use("folke/twilight.nvim")
    use("windwp/nvim-autopairs")
    use("numtostr/comment.nvim")
  end,
  config = {
    display = {
      open_fn = function() return require("packer.util").float({ border = "single" }) end,
    },
  },
})
