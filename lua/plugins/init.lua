local plugins = {
  {
    "nvim-lua/plenary.nvim",
    lazy = false,
  },
  {
    "morhetz/gruvbox",
    lazy = false,
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
  },
  {
    "kyazdani42/nvim-web-devicons",
    lazy = false,
  },
  {
    "nvim-lualine/lualine.nvim",
    lazy = false,
    dependencies = {
      "gruvbox",
      "nvim-web-devicons",
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
  },
  {
    "akinsho/bufferline.nvim",
    lazy = false,
    dependencies = {
      "gruvbox",
      "nvim-web-devicons",
    },
    version = "v3.*",
    config = function()
      require("bufferline").setup {
        options = {
          buffer_close_icon = "",
          close_icon = "",
          separator_style = "thick",
        },
      }
    end,
  },
  {
    "lukas-reineke/indent-blankline.nvim",
    lazy = false,
  },
  {
    "SebTalbot/lens.vim",
    config = function()
      vim.cmd [[let g:lens#disabled = 1]]
    end,
  },
  {
    "stevearc/dressing.nvim",
    config = function()
      require "plugins.configs.dressing"
    end,
  },
  {
    "simnalamburt/vim-mundo",
    init = function()
      require("core.mappings").mundo()
    end,
  },
  {
    "tpope/vim-fugitive",
  },
  {
    "lewis6991/gitsigns.nvim",
    config = function()
      require "plugins.configs.gitsigns"
    end,
  },
  {
    "akinsho/toggleterm.nvim",
    version = "*",
    config = function()
      require "plugins.configs.toggleterm"
    end,
  },
  {
    "nvim-treesitter/nvim-treesitter",
    build = function()
      require("nvim-treesitter.install").update { with_sync = true }
    end,
    config = function()
      require "plugins.configs.treesitter"
    end,
  },
  {
    "p00f/nvim-ts-rainbow",
    dependencies = {
      "nvim-treesitter",
    },
  },
  {
    "JoosepAlviste/nvim-ts-context-commentstring",
    dependencies = {
      "nvim-treesitter",
    },
  },
  {
    "tpope/vim-surround",
  },
  {
    "rbgrouleff/bclose.vim",
  },
  {
    "schickling/vim-bufonly",
  },
  {
    "folke/which-key.nvim",
    config = function()
      require "plugins.configs.which_key"
    end,
  },
  {
    "andymass/vim-matchup",
  },
  {
    "windwp/nvim-autopairs",
    config = function()
      require "plugins.configs.autopairs"
    end,
  },
  {
    "terrortylor/nvim-comment",
    config = function()
      require("nvim_comment").setup()
    end,
  },
  {
    "nvim-telescope/telescope.nvim",
    dependencies = {
      "plenary.nvim",
      "telescope-fzf-native.nvim",
    },
    config = function()
      require "plugins.configs.telescope"
    end,
  },
  {
    "nvim-telescope/telescope-fzf-native.nvim",
    -- dependencies = {
    --   "telescope.nvim",
    -- },
    build = "make",
  },
  {
    "LinArcX/telescope-env.nvim",
    dependencies = {
      "telescope.nvim",
    },
  },
  {
    "tknightz/telescope-termfinder.nvim",
    dependencies = {
      "telescope.nvim",
    },
  },
  {
    "kyazdani42/nvim-tree.lua",
    config = function()
      require "plugins.configs.nvim_tree"
    end,
  },
  -- LSP plugins
  {
    "williamboman/mason.nvim",
    lazy = false,
    build = ":MasonUpdate",
    config = function()
      require("mason").setup({})
    end,
  },
  {
    "neovim/nvim-lspconfig",
  },
  {
    "williamboman/mason-lspconfig.nvim",
    dependencies = {
      "mason.nvim",
      "nvim-lspconfig",
    },
    config = function()
      require "plugins.configs.lsp"
    end,
  },
  {
    "jose-elias-alvarez/typescript.nvim",
  },
  {
    "jose-elias-alvarez/null-ls.nvim",
  },
  {
    "jayp0521/mason-null-ls.nvim",
    dependencies = {
      "mason.nvim",
      "null-ls.nvim",
    },
  },
  -- DAP plugins
  {
    "mfussenegger/nvim-dap",
  },
  {
    "jayp0521/mason-nvim-dap.nvim",
    dependencies = {
      "nvim-dap",
    },
    config = function()
      require "plugins.configs.dap"
    end,
  },
  {
    "nvim-telescope/telescope-dap.nvim",
    dependencies = {
      "telescope.nvim",
      "nvim-dap",
    },
  },
  {
    "rcarriga/nvim-dap-ui",
    dependencies = {
      "nvim-dap",
    },
    config = [[require("plugins.configs.dap.ui")]],
  },
  -- Completion & Snippets
  {
    "hrsh7th/nvim-cmp",
    dependencies = {
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-cmdline",
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-nvim-lua",
      "hrsh7th/cmp-path",
      "ray-x/cmp-treesitter",
      -- { "tzachar/cmp-tabnine", run = "./install.sh" },
    },
    config = function()
      require "plugins.configs.nvim_cmp"
    end,
  },
  {
    "L3MON4D3/LuaSnip",
    requires = {
      "rafamadriz/friendly-snippets",
      "saadparwaiz1/cmp_luasnip",
    },
  },
}

return require("lazy").setup(plugins)
