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

   use {
     "folke/tokyonight.nvim",
     config = function()
       vim.g.tokyonight_style = "night"
       vim.cmd [[colorscheme tokyonight]]
     end
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

end)
