local cmd = vim.cmd

cmd [[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost lua/plugins/init.lua source <afile> | PackerSync
  augroup end
]]
