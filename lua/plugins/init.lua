local is_laptop = os.getenv("CURRENT_DEVICE") == "laptop"
local is_desktop = os.getenv("CURRENT_DEVICE") == "desktop"
local is_default = not is_laptop and not is_desktop

local plugins = {
  {
    "nvim-lua/plenary.nvim",
    lazy = false,
  },
  {
    "ellisonleao/gruvbox.nvim",
    lazy = false,
    enabled = is_desktop or is_default,
    priority = 1000,
    config = function()
      vim.g.gruvbox_italic = 1
      vim.opt.termguicolors = true
      vim.o.background = "dark"
      vim.cmd([[colorscheme gruvbox]])
      vim.cmd([[hi Normal ctermbg=none guibg=none]])
    end,
  },
  {
    "Mofiqul/dracula.nvim",
    lazy = false,
    priority = 1000,
    enabled = is_laptop,
    config = function()
      local dracula = require("dracula")
      dracula.setup({
        colors = {
          -- bg = "#2c2a38",
          -- fg = "#fce0f1",
          selection = "#383348",
          comment = "#6c5a78",
        },
      })
      vim.cmd([[colorscheme dracula]])
      vim.cmd([[hi Normal ctermbg=none guibg=none]])
      vim.cmd([[hi BufferLineFill ctermbg=none guibg=none]])
    end,
  },
  {
    "kyazdani42/nvim-web-devicons",
    lazy = false,
  },
  {
    "norcalli/nvim-colorizer.lua",
    config = function()
      require("colorizer").setup()
    end,
  },
  {
    "nvim-lualine/lualine.nvim",
    lazy = false,
    dependencies = {
      "nvim-web-devicons",
      "arkav/lualine-lsp-progress",
    },
    config = function()
      require("lualine").setup({
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
          lualine_x = {
            "lsp_progress",
          },
        },
      })
    end,
  },
  {
    "akinsho/bufferline.nvim",
    lazy = false,
    dependencies = {
      "nvim-web-devicons",
    },
    version = "*",
    config = function()
      require("bufferline").setup({
        options = {
          buffer_close_icon = "",
          close_icon = "",
          separator_style = "thin",
        },
      })
    end,
  },
  {
    "lukas-reineke/indent-blankline.nvim",
    lazy = false,
    main = "ibl",
    opts = {},
    config = function()
      require("ibl").setup()
    end,
  },
  {
    "SebTalbot/lens.vim",
    config = function()
      vim.cmd([[let g:lens#disabled = 1]])
    end,
  },
  {
    "stevearc/dressing.nvim",
    config = function()
      require("plugins.configs.dressing")
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
      require("plugins.configs.gitsigns")
    end,
  },
  {
    "akinsho/toggleterm.nvim",
    version = "*",
    config = function()
      require("plugins.configs.toggleterm")
    end,
  },
  {
    "nvim-treesitter/nvim-treesitter",
    build = function()
      require("nvim-treesitter.install").update({ with_sync = true })
    end,
    config = function()
      require("plugins.configs.treesitter")
    end,
  },
  {
    "JoosepAlviste/nvim-ts-context-commentstring",
    dependencies = {
      "nvim-treesitter",
    },
    config = function()
      require("ts_context_commentstring").setup({
        enable_autocmd = false,
      })
    end,
  },
  {
    "kylechui/nvim-surround",
    version = "*",
    event = "VeryLazy",
    config = function()
      require("nvim-surround").setup()
    end,
  },
  {
    "rbgrouleff/bclose.vim",
  },
  {
    "numtostr/BufOnly.nvim",
  },
  {
    "ashfinal/qfview.nvim",
    config = function()
      require("qfview").setup()
    end,
  },
  {
    "folke/which-key.nvim",
    version = "2.1.0",
    config = function()
      require("plugins.configs.which_key")
    end,
  },
  {
    "andymass/vim-matchup",
  },
  {
    "windwp/nvim-autopairs",
    config = function()
      require("plugins.configs.autopairs")
    end,
  },
  {
    "terrortylor/nvim-comment",
    config = function()
      require("nvim_comment").setup({
        hook = function()
          require("ts_context_commentstring").update_commentstring()
        end,
      })
    end,
  },
  {
    "nvim-telescope/telescope.nvim",
    dependencies = {
      "plenary.nvim",
      "telescope-fzf-native.nvim",
    },
    config = function()
      require("plugins.configs.telescope")
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
    "nvim-tree/nvim-tree.lua",
    config = function()
      require("plugins.configs.nvim_tree")
    end,
  },

  -- LSP plugins
  {
    "williamboman/mason.nvim",
    lazy = false,
    build = ":MasonUpdate",
    config = function()
      require("mason").setup({
        handlers = {
          pylint = function() end,
        },
      })
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
      "WhoIsSethDaniel/mason-tool-installer.nvim",
    },
    config = function()
      require("plugins.configs.lsp")
    end,
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
      require("plugins.configs.dap")
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
      "nvim-neotest/nvim-nio",
    },
    config = [[require("plugins.configs.dap.ui")]],
  },

  -- Completion & Snippets
  {
    "codota/tabnine-nvim",
    build = "./dl_binaries.sh",
    config = function()
      require("plugins.configs.tabnine")
    end,
  },
  {
    "hrsh7th/nvim-cmp",
    dependencies = {
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-cmdline",
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-nvim-lua",
      "hrsh7th/cmp-path",
      "ray-x/cmp-treesitter",
    },
    config = function()
      require("plugins.configs.nvim_cmp")
    end,
  },
  {
    "L3MON4D3/LuaSnip",
    build = "make install_jsregexp",
    dependencies = {
      "rafamadriz/friendly-snippets",
      "saadparwaiz1/cmp_luasnip",
    },
  },
}

return require("lazy").setup(plugins)
