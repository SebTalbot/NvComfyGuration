local present, packer = pcall(require, "plugins.packerInit")
if not present then
  print "Warning: Cannot find packer"
  return false
end

return packer.startup(function(use)
  use "nvim-lua/plenary.nvim"

  use {
    "wbthomason/packer.nvim",
  }

  use {
    "morhetz/gruvbox",
    config = function()
      local is_laptop = os.getenv "CURRENT_DEVICE" == "laptop"
      vim.g.gruvbox_italic = 1
      vim.opt.termguicolors = true
      vim.o.background = "dark"
      vim.cmd [[colorscheme gruvbox]]
      if is_laptop then
        vim.cmd [[highlight Normal guibg=none]]
      end
    end,
  }

  use "kyazdani42/nvim-web-devicons"

  use {
    "nvim-lualine/lualine.nvim",
    requires = {
      "kyazdani42/nvim-web-devicons",
      opt = true,
    },
    config = function()
      require("lualine").setup {
        options = {
          ignore_focus = {
            "dapui_watches",
            "dapui_stacks",
            "dapui_breakpoints",
            "dapui_scopes",
            "dap-repl",
            "dapui_console",
          },
        },
        sections = {
          lualine_c = {
            {
              "filename",
              path = 1,
            },
          },
        },
      }
    end,
  }

  use {
    "akinsho/bufferline.nvim",
    requires = "kyazdani42/nvim-web-devicons",
    tag = "v2.*",
    config = function()
      require("bufferline").setup {
        options = {
          buffer_close_icon = "",
          close_icon = "",
          separator_style = "thick",
        },
      }
    end,
  }

  use {
    "camspiers/lens.vim",
    config = function()
      vim.cmd [[let g:lens#disabled = 1]]
    end,
  }

  use {
    "stevearc/dressing.nvim",
    config = [[require("plugins.configs.dressing")]],
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
    after = { "gruvbox" },
    tag = "*",
    config = [[require("plugins.configs.toggleterm")]],
  }

  use {
    "nvim-treesitter/nvim-treesitter",
    run = function()
      require("nvim-treesitter.install").update { with_sync = true }
    end,
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

  use "LinArcX/telescope-env.nvim"

  use "tknightz/telescope-termfinder.nvim"

  use {
    "kyazdani42/nvim-tree.lua",
    config = function()
      require "plugins.configs.nvim_tree"
    end,
  }

  -- Mason Servers manager
  use {
    "williamboman/mason.nvim",
    config = [[require("mason").setup({})]],
  }
  -- use {
  --   "RubixDev/mason-update-all",
  --   config = [[require("mason-update-all").setup({})]],
  -- }

  -- LSP
  use "neovim/nvim-lspconfig"
  use {
    "williamboman/mason-lspconfig.nvim",
    after = "nvim-lspconfig",
    config = [[require("plugins.configs.lsp")]],
  }
  use "jose-elias-alvarez/typescript.nvim"

  -- Null-ls (code actions, diagnostics, formatting)
  use "jose-elias-alvarez/null-ls.nvim"
  use "jayp0521/mason-null-ls.nvim"

  -- use {
  --   "weilbith/nvim-code-action-menu",
  --   cmd = "CodeActionMenu",
  -- }

  -- DAP
  use "mfussenegger/nvim-dap"
  use {
    "jayp0521/mason-nvim-dap.nvim",
    after = "nvim-dap",
    config = [[require("plugins.configs.dap")]],
  }

  use "nvim-telescope/telescope-dap.nvim"
  use {
    "rcarriga/nvim-dap-ui",
    config = [[require("plugins.configs.dap.ui")]],
  }

  -- Completion & Snippets

  use {
    "hrsh7th/nvim-cmp",
    requires = {
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-cmdline",
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-nvim-lua",
      "hrsh7th/cmp-path",
      "ray-x/cmp-treesitter",
      -- { "tzachar/cmp-tabnine", run = "./install.sh" },
    },
    config = [[require("plugins.configs.nvim_cmp")]],
  }

  use {
    "L3MON4D3/LuaSnip",
    requires = {
      "rafamadriz/friendly-snippets",
      "saadparwaiz1/cmp_luasnip",
    },
  }
end)
