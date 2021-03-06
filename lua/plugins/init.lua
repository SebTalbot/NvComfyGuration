local present, packer = pcall(require, "plugins.packerInit")

if not present then
  print "Warning: Cannot find packer"
  return false
end

return packer.startup(function(use)
  local isLaptop = (os.getenv "CURRENT_DEVICE" == "laptop")
  local isHome = (os.getenv "CURRENT_DEVICE" == "home")

  use "nvim-lua/plenary.nvim"

  use {
    "wbthomason/packer.nvim",
  }

  use {
    "folke/tokyonight.nvim",
    disable = isLaptop,
    config = function()
      vim.g.tokyonight_style = "night"
      vim.cmd [[colorscheme tokyonight]]
    end,
  }

  use {
    "morhetz/gruvbox",
    disable = not isLaptop,
    config = function()
      vim.opt.termguicolors = true
      vim.o.background = "dark"
      vim.cmd [[colorscheme gruvbox]]
    end,
  }

  use "kyazdani42/nvim-web-devicons"

  use {
    "nvim-lualine/lualine.nvim",
    requires = { "kyazdani42/nvim-web-devicons", opt = true },
    config = function()
      require("lualine").setup()
    end,
  }

  use {
    "akinsho/bufferline.nvim",
    requires = "kyazdani42/nvim-web-devicons",
    tag = "v2.*",
    config = function()
      require("bufferline").setup {}
    end,
  }

  use {
    "camspiers/lens.vim",
    config = function()
      vim.cmd [[let g:lens#disabled = 1]]
    end,
  }

  use {
    "simnalamburt/vim-mundo",
    config = function()
      require("core.mappings").mundo()
    end,
  }

  use "tpope/vim-fugitive"

  use {
    "lewis6991/gitsigns.nvim",
    config = [[require("plugins.configs.gitsigns")]],
  }

  use {
    "akinsho/toggleterm.nvim",
    after = { "gruvbox", "tokyonight.nvim" },
    tag = "v1.*",
    config = [[require("plugins.configs.toggleterm")]],
  }

  use {
    "nvim-treesitter/nvim-treesitter",
    run = [[:TSUpdate]],
    config = [[require("plugins.configs.treesitter")]],
  }
  use {
    "p00f/nvim-ts-rainbow",
    after = "nvim-treesitter",
  }

  use {
    "JoosepAlviste/nvim-ts-context-commentstring",
    after = "nvim-treesitter",
  }

  use "tpope/vim-surround"

  use "rbgrouleff/bclose.vim"

  use "schickling/vim-bufonly"

  use {
    config = [[require("plugins.configs.which_key")]],
    "folke/which-key.nvim",
  }

  use "andymass/vim-matchup"

  use {
    "windwp/nvim-autopairs",
    config = [[require("plugins.configs.autopairs")]],
  }

  use {
    "terrortylor/nvim-comment",
    config = function()
      require("nvim_comment").setup()
    end,
  }

  use {
    "nvim-telescope/telescope.nvim",
    after = "toggleterm.nvim",
    config = [[require("plugins.configs.telescope")]],
  }

  use {
    "nvim-telescope/telescope-fzf-native.nvim",
    run = "make",
  }

  use { "LinArcX/telescope-env.nvim" }

  use { "tknightz/telescope-termfinder.nvim" }

  use {
    "kyazdani42/nvim-tree.lua",
    config = function()
      require "plugins.configs.nvim_tree"
    end,
  }

  use {
    "neovim/nvim-lspconfig",
    config = [[require("plugins.configs.lsp")]],
  }

  use "williamboman/nvim-lsp-installer"

  use {
    "hrsh7th/nvim-cmp",
    config = [[require("plugins.configs.nvim_cmp")]],
  }
  use "hrsh7th/cmp-buffer"
  use "hrsh7th/cmp-path"
  use "hrsh7th/cmp-cmdline"
  use "hrsh7th/cmp-nvim-lsp"
  use "hrsh7th/cmp-nvim-lua"

  use "L3MON4D3/LuaSnip"
  use "rafamadriz/friendly-snippets"
  use "saadparwaiz1/cmp_luasnip"

  use "jose-elias-alvarez/null-ls.nvim"
  use "jose-elias-alvarez/nvim-lsp-ts-utils"
end)
