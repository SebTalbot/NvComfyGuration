local map = require("core.utils").map
local mapBuf = require("core.utils").mapBuf

vim.g.mapleader = " " -- Space leader key

local M = {}

--== INIT ON STARTUP ==--------------------------------------------------------
-- General
M.disable = function()
  map("n", "Q", "<nop>")
  map("n", "<C-z>", "<nop>")
  map("v", "u", "gv")
end

M.overwrite = function()
  map("v", "<", "<gv")
  map("v", ">", ">gv")
  map("v", "p", [["_dP]])
end

M.general = function()
  map("n", "<leader><leader>", ":WhichKey<CR>")
  map("n", "<leader>*", "*``")
  map("n", "<leader>h", "<cmd>lua require('telescope.builtin').help_tags()<CR>")
  map("n", "<leader>/", ":nohlsearch<CR>")
  map("n", "<C-j>", ":m .+1<CR>==")
  map("n", "<C-k>", ":m .-2<CR>==")
  map("v", "<C-j>", ":m '>+1<CR>gv=gv")
  map("v", "<C-k>", ":m '<-2<CR>gv=gv")
end

M.buffers = function()
  map("n", "<leader>bdd", ":Bclose!<CR>")
  map("n", "<leader>bdo", ":BufOnly<CR>")
  map("n", "<leader>bdl", "")
  map("n", "<leader>bb", ":e#<CR>")
  map("n", "<leader>bn", ":bn<CR>")
  map("n", "<leader>bp", ":bp<CR>")
end

M.windows = function()
  map("n", "<leader>wd", "<C-w>q")
  map("n", "<leader>wJ", "<C-w><S-j>")
  map("n", "<leader>wK", "<C-w><S-k>")
  map("n", "<leader>wL", "<C-w><S-l>")
  map("n", "<leader>wH", "<C-w><S-h>")
  map("n", "<leader>wj", "<C-w><C-j>")
  map("n", "<leader>wk", "<C-w><C-k>")
  map("n", "<leader>wl", "<C-w><C-l>")
  map("n", "<leader>wh", "<C-w><C-h>")
  map("n", "<leader>ws", "<C-w>s")
  map("n", "<leader>wv", "<C-w>v")
  map("n", "<leader>wrr", ":call lens#run()<CR>")
  map("n", "<leader>wre", "<C-w>=")
end

-- Files
M.files = function()
  map("n", "<leader>zi", ":e ~/.config/i3/config<CR>")
  map("n", "<leader>zv", ":e ~/.config/nvim/init.lua<CR>")
  map("n", "<leader>zm", ":e ~/.config/nvim/lua/core/mappings.lua<CR>")
  map("n", "<leader>zb", ":e ~/.zshrc<CR>")
end

-- Commands
M.commands = function()
  local cmd = vim.cmd
  -- General
  cmd "command! ClearRegisters for i in range(34,122) | silent! call setreg(nr2char(i), []) | endfor"

  -- Packer
  cmd "silent! command PackerClean lua require 'plugins' require('packer').clean()"
  cmd "silent! command PackerCompile lua require 'plugins' require('packer').compile()"
  cmd "silent! command PackerInstall lua require 'plugins' require('packer').install()"
  cmd "silent! command PackerStatus lua require 'plugins' require('packer').status()"
  cmd "silent! command PackerSync lua require 'plugins' require('packer').sync()"
  cmd "silent! command PackerUpdate lua require 'plugins' require('packer').update()"
  -- LSP
  cmd "silent! command LspFormatting lua vim.lsp.buf.formatting()"
end

-- Init
M.disable()
M.overwrite()
M.general()
M.buffers()
M.windows()
M.files()
M.commands()

--== EXTERNAL INIT ==----------------------------------------------------------
-- Plugins
M.telescope = function()
  map("n", "<leader>fb", ":Telescope buffers <CR>")
  map("n", "<leader>ff", ":Telescope find_files <CR>")
  map("n", "<leader>fa", ":Telescope find_files follow=true no_ignore=true hidden=true <CR>")
  map("n", "", ":Telescope git_commits <CR>")
  map("n", "", ":Telescope git_status <CR>")
  map("n", "", ":Telescope help_tags <CR>")
  map("n", "<leader>fw", ":Telescope live_grep <CR>")
  map("n", "", ":Telescope oldfiles <CR>")
  map("n", "", ":Telescope themes <CR>")
end

M.nvim_tree = function()
  map("n", "<leader>nt", ":NvimTreeToggle <CR>")
  map("n", "<leader>nn", ":NvimTreeFindFile <CR>")
end

-- LSP
M.lsp = function(buf)
  mapBuf(buf, "n", "<leader>ll", "<cmd>lua vim.lsp.buf.declaration()<CR>")
  mapBuf(buf, "n", "<leader>ld", "<cmd>lua require('telescope.builtin').lsp_definitions()<CR>")
  mapBuf(buf, "n", "<S-k>", "<cmd>lua vim.lsp.buf.hover()<CR>")
  mapBuf(buf, "n", "<leader>li", "<cmd>lua require('telescope.builtin').lsp_implementations()<CR>")
  mapBuf(buf, "n", "", "<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>")
  mapBuf(buf, "n", "", "<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>")
  mapBuf(buf, "n", "", "<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>")
  mapBuf(buf, "n", "<leader>lt", "<cmd>lua require('telescope.builtin').lsp_type_definitions()<CR>")
  mapBuf(buf, "n", "<leader>laa", "<cmd>lua require('telescope.builtin').lsp_code_actions(require('telescope.themes').get_cursor({}))<CR>")
  mapBuf(buf, "n", "<leader>laf", "<cmd>lua vim.lsp.buf.formatting()<CR>")
  mapBuf(buf, "n", "<leader>lar", "<cmd>lua vim.lsp.buf.rename()<CR>")
  mapBuf(buf, "n", "<leader>lr", "<cmd>lua require('telescope.builtin').lsp_references()<CR>")
  mapBuf(buf, "n", "<leader>ee", "<cmd>lua vim.diagnostic.open_float()<CR>")
  mapBuf(buf, "n", "<leader>ep", "<cmd>lua vim.diagnostic.goto_prev()<CR>")
  mapBuf(buf, "n", "<leader>en", "<cmd>lua vim.diagnostic.goto_next()<CR>")
  mapBuf(buf, "n", "<leader>el", "<cmd>lua vim.diagnostic.setloclist()<CR>")
end

return M
