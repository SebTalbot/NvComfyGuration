local present, packer = pcall(require, "plugins.packerInit")

if not present then
   return false
end

local use = packer.use

packer.startup(function()

  use "nvim-lua/plenary.nvim"

  use {
    "wbthomason/packer.nvim",
  }

  use {
    "folke/tokyonight.nvim",
    config = function()
      vim.g.tokyonight_style = "night"
      vim.cmd [[colorscheme tokyonight]]
    end,
  }

  use "kyazdani42/nvim-web-devicons"

  use {
    "akinsho/bufferline.nvim",
    config = function()
      require("bufferline").setup{}
    end,
  }

  use {
    "nvim-treesitter/nvim-treesitter",
    config = [[require("plugins.configs.treesitter")]],
  }

  use "tpope/vim-surround"

  use "rbgrouleff/bclose.vim"

  use {
    "terrortylor/nvim-comment",
    config = function()
      require('nvim_comment').setup()
    end,
  }

  use {
    "nvim-telescope/telescope.nvim",
    config = [[require("plugins.configs.telescope")]],
  }

  use {
    "kyazdani42/nvim-tree.lua",
    config = function()
      require("plugins.configs.nvim_tree")
    end,
  }

  use "neovim/nvim-lspconfig"

  -- use "williamboman/nvim-lsp-installer"

  -- use "ray-x/lsp_signature.nvim"

  -- use "andymass/vim-matchup"

  -- use "rafamadriz/friendly-snippets"
  -- use "hrsh7th/nvim-cmp"
  -- use "L3MON4D3/LuaSnip"
  -- use "saadparwaiz1/cmp_luasnip"
  -- use "hrsh7th/cmp-nvim-lua"
  -- use "hrsh7th/cmp-nvim-lsp"
  -- use "hrsh7th/cmp-buffer"
  -- use "hrsh7th/cmp-path"
  -- use "jose-elias-alvarez/null-ls.nvim"
  -- use "jose-elias-alvarez/nvim-lsp-ts-utils"

-- require("plugins.configs.lsp")
-- require("plugins.configs.lsp_install")
-- require("plugins.configs.nvim_cmp")

end)
