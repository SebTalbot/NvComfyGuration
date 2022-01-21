local M = {}
local map = require("core.utils").map

local plugin_maps = {
    telescope = {
        find_files = " ff"
    }
}

-- Required
local cmd = vim.cmd
      -- Add Packer commands because we are not loading it at startup
      cmd "silent! command PackerClean lua require 'plugins' require('packer').clean()"
      cmd "silent! command PackerCompile lua require 'plugins' require('packer').compile()"
      cmd "silent! command PackerInstall lua require 'plugins' require('packer').install()"
      cmd "silent! command PackerStatus lua require 'plugins' require('packer').status()"
      cmd "silent! command PackerSync lua require 'plugins' require('packer').sync()"
      cmd "silent! command PackerUpdate lua require 'plugins' require('packer').update()"

M.telescope = function()
   local m = plugin_maps.telescope

--    map("n", m.buffers, ":Telescope buffers <CR>")
   map("n", m.find_files, ":Telescope find_files <CR>")
--    map("n", m.find_hiddenfiles, ":Telescope find_files follow=true no_ignore=true hidden=true <CR>")
--    map("n", m.git_commits, ":Telescope git_commits <CR>")
--    map("n", m.git_status, ":Telescope git_status <CR>")
--    map("n", m.help_tags, ":Telescope help_tags <CR>")
--    map("n", m.live_grep, ":Telescope live_grep <CR>")
--    map("n", m.oldfiles, ":Telescope oldfiles <CR>")
--    map("n", m.themes, ":Telescope themes <CR>")
end

return M