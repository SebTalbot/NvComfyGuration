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
  map("v", "<C-p>", [["_dP]])
end

M.general = function()
  map("n", "<leader><leader>", "<cmd>WhichKey <CR>")
  map("n", "<leader>*", "*``")
  map("n", "<leader>/", "<cmd>nohlsearch <CR>")
  map("n", "<C-s>", "<cmd>write! <CR>")
  map("i", "<C-s>", "<cmd>write! <CR>")
  map("n", "<leader>yf", "<cmd>let @+ = expand('%:r') <CR>")
  map("n", "<leader>yy", "<cmd>let @+ = expand('%:t:r') <CR>")
  map("n", "<C-j>", ":m .+1<CR>==")
  map("n", "<C-k>", ":m .-2<CR>==")
  map("v", "<C-j>", ":m '>+1<CR>gv=gv")
  map("v", "<C-k>", ":m '<-2<CR>gv=gv")
  map("t", "<C-space>", "<C-\\><C-n>")

  -- Quick
  map("n", "<leader>qq", "<cmd>qa! <CR>")
  map("n", "<leader>qw", "<cmd>w <CR>")
  map("n", "<leader>qW", "<cmd>wa <CR>")

  -- Git
  map("n", "<leader>gat", "<cmd>GitStashAll <CR>")
  map("n", "<leader>gL", "<cmd>Git blame <CR>")
  map("i", "<C-l>", "<Esc>a")
end

M.buffers = function()
  map("n", "<leader>bdd", "<cmd>Bclose! <CR>")
  map("n", "<leader>bdo", "<cmd>BufOnly <CR><cmd>lua require('lualine').refresh()<CR>")
  map("n", "<leader>bb", "<cmd>e#<CR>")
  map("n", "<leader>bn", "<cmd>bn<CR>")
  map("n", "<leader>bp", "<cmd>bp<CR>")
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
  map("n", "<leader>wrr", "<cmd>call lens#run()<CR>")
  map("n", "<leader>wre", "<C-w>=")
end

M.applications = function()
  map("n", "<leader>ah", "<cmd>checkhealth<CR>")
  map("n", "<leader>al", "<cmd>Lazy<CR>")
  map("n", "<leader>am", "<cmd>Mason<CR>")
end

-- Files
M.files = function()
  map("n", "<leader>zi", "<cmd>e ~/.config/i3/config<CR>")
  map("n", "<leader>zp", "<cmd>e ~/.config/polybar/config<CR><cmd>setfiletype dosini<CR>")
  map("n", "<leader>zr", "<cmd>e ~/.config/rofi/config.rasi<CR><cmd>setfiletype rasi<CR>")
  map("n", "<leader>zt", "<cmd>e ~/.config/kitty/kitty.conf<CR>")
  map("n", "<leader>zb", "<cmd>e ~/.zshrc<CR>")
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
  cmd "silent! command LspFormatting lua vim.lsp.buf.format()"
  -- Git
  cmd "silent! command GitStashAll !git stash -u"
end

-- Init
M.disable()
M.overwrite()
M.general()
M.buffers()
M.windows()
M.applications()
M.files()
M.commands()

--== EXTERNAL INIT ==----------------------------------------------------------
-- Plugins
M.telescope = function()
  -- Find
  map("n", "<leader>fa", "<cmd>Telescope find_files follow=true no_ignore=true hidden=true <CR>")
  map("n", "<leader>fb", "<cmd>Telescope buffers <CR>")
  map("n", "<leader>fc", "<cmd>Telescope commands <CR>")
  map("n", "<leader>ff", "<cmd>lua _TelescopeFileIgnore() <CR>")
  map("n", "<leader>fF", "<cmd>Telescope find_files follow=true <CR>")
  map("n", "<leader>fg", "<cmd>lua _TelescopeGrepIgnore() <CR>")
  map("n", "<leader>fG", "<cmd>Telescope live_grep <CR>")
  map("n", "<leader>fr", "<cmd>Telescope resume <CR>")
  map("n", "<leader>fs", "<cmd>Telescope spell_suggest <CR>")
  map("n", "<leader>ft", "<cmd>Telescope termfinder find <CR>")
  map("n", "<leader>fw", "<cmd>lua _TelescopeWordIgnore() <CR>")
  map("n", "<leader>fW", "<cmd>Telescope grep_string <CR>")

  -- General
  map("n", "<leader>h", "<cmd>lua require('telescope.builtin').help_tags()<CR>")
  -- Git
  map("n", "<leader>gb", "<cmd>Telescope git_branches <CR>")
  map("n", "<leader>gc", "<cmd>Telescope git_commits <CR>")
  map("n", "<leader>gC", "<cmd>Telescope git_bcommits <CR>")
  map("n", "<leader>gs", "<cmd>Telescope git_status <CR>")
  map("n", "<leader>gS", "<cmd>Telescope git_stash <CR>")
end

M.gitsigns = function()
  map("n", "<leader>gd", "<cmd>Gitsigns toggle_deleted<CR> <cmd>sleep 200ms<CR> <cmd>Gitsigns toggle_linehl<CR>")
  map("n", "<leader>gg", "<cmd>Gitsigns preview_hunk <CR>")
  map("n", "<leader>gl", "<cmd>Gitsigns blame_line <CR>")
  map("n", "<leader>gn", "<cmd>silent Gitsigns next_hunk <CR>")
  map("n", "<leader>gp", "<cmd>silent Gitsigns prev_hunk <CR>")
  map("n", "<leader>gv", "<cmd>Gitsigns select_hunk <CR>")
  map("n", "<leader>gar", "<cmd>Gitsigns reset_hunk <CR>")
  map("n", "<leader>gaR", "<cmd>Gitsigns reset_buffer <CR>")
  map("n", "<leader>gas", "<cmd>Gitsigns stage_hunk <CR>")
  map("n", "<leader>gaS", "<cmd>Gitsigns stage_buffer <CR>")
  map("n", "<leader>gau", "<cmd>Gitsigns undo_stage_hunk <CR>")
end

M.toggleterm = function()
  map("n", "<leader>t", "<cmd>lua _Toggleterm_main() <CR>")
  map("n", "<leader>ge", "<cmd>lua _Toggleterm_lazygit() <CR>")
end

M.nvim_tree = function()
  map("n", "<leader>nt", "<cmd>NvimTreeToggle <CR>")
  map("n", "<leader>nn", "<cmd>NvimTreeFindFile <CR>")
end

M.mundo = function()
  map("n", "<leader>fu", "<cmd>MundoToggle <CR>")
end

-- LSP
M.lsp = function(buf)
  mapBuf(buf, "n", "<leader>ll", "<cmd>lua vim.lsp.buf.declaration()<CR>")
  mapBuf(buf, "n", "<S-k>", "<cmd>lua vim.lsp.buf.hover()<CR>")
  mapBuf(buf, "n", "<leader>laf", "<cmd>lua vim.lsp.buf.format()<CR>")
  mapBuf(buf, "n", "<leader>lar", "<cmd>lua vim.lsp.buf.rename()<CR>")
  mapBuf(buf, "n", "<leader>ee", "<cmd>lua vim.diagnostic.open_float()<CR>")
  mapBuf(buf, "n", "<leader>ep", "<cmd>lua vim.diagnostic.goto_prev()<CR>")
  mapBuf(buf, "n", "<leader>eP", "<cmd>lua vim.diagnostic.goto_prev({severity = vim.diagnostic.severity.ERROR})<CR>")
  mapBuf(buf, "n", "<leader>en", "<cmd>lua vim.diagnostic.goto_next()<CR>")
  mapBuf(buf, "n", "<leader>eN", "<cmd>lua vim.diagnostic.goto_next({severity = vim.diagnostic.severity.ERROR})<CR>")
  mapBuf(buf, "n", "<leader>el", "<cmd>lua vim.diagnostic.setloclist()<CR>")
  mapBuf(buf, "v", "<leader>la", "<cmd>lua vim.lsp.buf.range_code_action()<CR>")
  -- telescope extension
  mapBuf(buf, "n", "<leader>ld", "<cmd>lua require('telescope.builtin').lsp_definitions()<CR>")
  mapBuf(buf, "n", "<leader>li", "<cmd>lua require('telescope.builtin').lsp_implementations()<CR>")
  mapBuf(buf, "n", "<leader>lt", "<cmd>lua require('telescope.builtin').lsp_type_definitions()<CR>")
  mapBuf(buf, "n", "<leader>lr", "<cmd>lua require('telescope.builtin').lsp_references()<CR>")
  -- code action menu plugin
  mapBuf(buf, "n", "<leader>laa", "<cmd>lua vim.lsp.buf.code_action()<CR>")
end

-- DAP
M.dap = function()
  map("n", "<leader>dc", '<cmd>lua require"dap".continue()<CR>')
  map("n", "<leader>dd", '<cmd>lua require"dap".toggle_breakpoint()<CR>')
  map("n", "<leader>di", '<cmd>lua require"dap".step_into()<CR>')
  map("n", "<leader>do", '<cmd>lua require"dap".step_over()<CR>')
  map("n", "<leader>dq", '<cmd>lua require"dap".terminate()<CR>')
  map("n", "<leader>du", '<cmd>lua require"dap".step_out()<CR>')
  -- telescope extension
  map("n", "<leader>dfc", '<cmd>lua require"telescope".extensions.dap.commands{}<CR>')
  map("n", "<leader>dff", '<cmd>lua require"telescope".extensions.dap.frames{}<CR>')
  map("n", "<leader>dfg", '<cmd>lua require"telescope".extensions.dap.configurations{}<CR>')
  map("n", "<leader>dfs", '<cmd>lua require"telescope".extensions.dap.variables{}<CR>')
  map("n", "<leader>dft", '<cmd>lua require"telescope".extensions.dap.list_breakpoints{}<CR>')
  -- DAP UI
  map("n", "<leader>dt", "<cmd>lua require('dapui').toggle()<CR>")
end

return M
