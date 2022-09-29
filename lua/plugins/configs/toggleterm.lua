local present, toggleterm = pcall(require, "toggleterm")
if not present then
  print "Warning: toggleterm not found"
  return
end

toggleterm.setup {
  open_mapping = [[<c-\>]],
  hide_numbers = true,
  shade_filetypes = {},
  shade_terminals = false,
  shading_factor = 3,
  start_in_insert = true,
  insert_mappings = true,
  terminal_mappings = true,
  persist_size = false,
  direction = "float",
  close_on_exit = true,
  shell = vim.o.shell,
  float_opts = {
    border = "single",
    winblend = 0,
    highlights = {
      border = "Normal",
      background = "Normal",
    },
  },
}

-- Custom Terminals
local ttt = require('toggleterm.terminal')
local Terminal = require("toggleterm.terminal").Terminal

-- Broken with toggleterm update
-- local nameTerm = function (term, name)
--   vim.api.nvim_buf_set_name(term.bufnr, name)
--   ttt.get(term.id).name = name
-- end

local initTerm = function (term, name)
  term:spawn()
  -- nameTerm(term, name)
end

local mainTerminal = Terminal:new { count = 1 }
initTerm(mainTerminal, "Main")
function _Toggleterm_main()
  mainTerminal:toggle()
end

local lazygit = Terminal:new { cmd = "lazygit", count = 11 }
function _Toggleterm_lazygit()
  lazygit:toggle()
  -- nameTerm(lazygit, "Git")
end

require("core.mappings").toggleterm()
