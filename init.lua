-- Lazy.vim
vim.g.mapleader = " " -- Space leader key
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)
require("plugins")

-- nvim_tree
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- Loading custom files
local modules = {
  "core.autocommands",
  "core.options",
  "core.mappings",
}

for _, module in ipairs(modules) do
  local ok, err = pcall(require, module)
  if not ok then
    error("Error loading " .. module .. "\n\n" .. err)
  end
end
