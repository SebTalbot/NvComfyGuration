local present, packer = pcall(require, "plugins.packerInit")

local useConfigs = function (name)
    if string.match(name, "^%(") then
        name = name:sub(2)
        name = name:gsub("%)%.", "').", 1)
        return "require('" .. name
    end
   return "require('" .. name .. "')"    
end

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
      "nvim-telescope/telescope.nvim",
      module = "telescope",
      cmd = "Telescope",
      config = useConfigs("plugins.configs.telescope.config"),
      setup = function()
         require("core.mappings").telescope()
      end,
   }

end)