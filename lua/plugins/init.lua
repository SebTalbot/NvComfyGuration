local present, packer = pcall(require, "plugins.packerInit")

if not present then
   return false
end

local use = packer.use

return packer.startup(function()
   use "Nvchad/extensions"
   use "nvim-lua/plenary.nvim"

   use {
      "wbthomason/packer.nvim",
      event = "VimEnter",
   }

   -- Theme and UI

  use {
   "folke/tokyonight.nvim",
   config = function()
     vim.g.tokyonight_style = "night"
     vim.cmd [[colorscheme tokyonight]]
   end
  }

  use "kyazdani42/nvim-web-devicons"

  use {
    'akinsho/bufferline.nvim',
    config = function ()
      require("bufferline").setup{}
    end
  }

   use {
      "nvim-treesitter/nvim-treesitter",
      event = "BufRead",
      config = function ()
        require("plugins.configs.treesitter")
      end,
   }

  -- Tools

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
      module = "telescope",
      cmd = "Telescope",
      config = "require('plugins.configs.telescope')",
      setup = function()
         require("core.mappings").telescope()
      end,
   }

  use {
      'kyazdani42/nvim-tree.lua',
      setup = function()
         require("core.mappings").nvim_tree()
      end,
      config = function()
        require("plugins.configs.nvim_tree")
      end
  }

   -- LSP and Completion

   use {
      "neovim/nvim-lspconfig",
      opt = true,
      config = function()
        -- require("plugins.configs.lsp").lspconfig()
      end,
      setup = function()
         require("core.utils").packer_lazy_load "nvim-lspconfig"
         vim.defer_fn(function()
            vim.cmd 'if &ft == "packer" | echo "" | else | silent! e %'
         end, 0)
      end,
   }

   use {
     "williamboman/nvim-lsp-installer",
     config = function()
       require("plugins.configs.lsp")
     end,
   }

   use {
      "ray-x/lsp_signature.nvim",
      after = "nvim-lspconfig",
      config = function()
        -- require("plugins.configs.lsp").signature()
      end,
  }

   use {
      "andymass/vim-matchup",
      opt = true,
      setup = function()
         require("core.utils").packer_lazy_load "vim-matchup"
      end,
   }

   use {
      "rafamadriz/friendly-snippets",
      event = "InsertEnter",
   }

   use {
      "hrsh7th/nvim-cmp",
      config = function()
        require("plugins.configs.nvim_cmp")
      end,
   }

   use {
      "L3MON4D3/LuaSnip",
      wants = "friendly-snippets",
      -- config = override_req("luasnip", "plugins.configs.others", "luasnip"),
   }

   use {
      "saadparwaiz1/cmp_luasnip",
   }

   use {
      "hrsh7th/cmp-nvim-lua",
   }

   use {
      "hrsh7th/cmp-nvim-lsp",
   }

   use {
      "hrsh7th/cmp-buffer",
   }

   use {
      "hrsh7th/cmp-path",
   }

end)
