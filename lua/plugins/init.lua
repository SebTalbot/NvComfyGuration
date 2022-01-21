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

  -- Tools

  use "tpope/vim-surround"

  use "rbgrouleff/bclose.vim"

   use {
      "nvim-telescope/telescope.nvim",
      module = "telescope",
      cmd = "Telescope",
      config = "require('plugins.configs.telescope')",
      setup = function()
         require("core.mappings").telescope()
      end,
   }

   -- LSP and Completion

   use {
      "neovim/nvim-lspconfig",
      opt = true,
      setup = function()
         require("core.utils").packer_lazy_load "nvim-lspconfig"
         vim.defer_fn(function()
            vim.cmd 'if &ft == "packer" | echo "" | else | silent! e %'
         end, 0)
      end,
      -- config = override_req("lspconfig", "plugins.configs.lspconfig"),
   }

end)
