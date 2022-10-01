local packer_path = os.getenv("XDG_DATA_HOME") .. "/nvim/site/pack/packer/start/packer.nvim"
if vim.fs.exists(packer_path) then
  os.execute("git clone --depth=\"1\" \"https://github.com/wbthomason/packer.nvim.git\" \"" .. packer_path .. "\"")
end
local mason_path = os.getenv("XDG_DATA_HOME") .. "/nvim/site/pack/packer/start/mason.nvim"
if vim.fs.exists(mason_path) then
  os.execute("git clone --depth=\"1\" \"https://github.com/williamboman/mason.nvim.git\" \"" .. mason_path .. "\"")
end

_G.plugins = {
  "wbthomason/packer.nvim",
  "williamboman/mason.nvim",

  "kyazdani42/nvim-web-devicons",
  "catppuccin/nvim",

  "nvim-lua/plenary.nvim",
  "nvim-lua/popup.nvim",
  "rcarriga/nvim-notify",
  "stevearc/dressing.nvim",

  "numtostr/fterm.nvim",
  "kyazdani42/nvim-tree.lua",
  "nvim-telescope/telescope.nvim",
  "theprimeagen/harpoon",

  "utilyre/barbecue.nvim",
  "j-hui/fidget.nvim",
  "nvim-lualine/lualine.nvim",

  "lewis6991/gitsigns.nvim",
  "nvim-treesitter/nvim-treesitter",
  "p00f/nvim-ts-rainbow",
  "lukas-reineke/indent-blankline.nvim",
  "windwp/nvim-ts-autotag",
  "windwp/nvim-autopairs",
  "numtostr/comment.nvim",

  "l3mon4d3/luasnip",
  "rafamadriz/friendly-snippets",

  "zbirenbaum/neodim",
  "neovim/nvim-lspconfig",
  "jose-elias-alvarez/null-ls.nvim",
  "smiteshp/nvim-navic",
  "rrethy/vim-illuminate",

  "hrsh7th/nvim-cmp",
  "saadparwaiz1/cmp_luasnip",
  "hrsh7th/cmp-nvim-lsp",
  "hrsh7th/cmp-buffer",
}
