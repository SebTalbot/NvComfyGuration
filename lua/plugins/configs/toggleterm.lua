local present, toggleterm = pcall(require, "toggleterm")

if not present then
  print "Warning: toggleterm not found"
  return
end

toggleterm.setup {
  -- size can be a number or function which is passed the current terminal
  size = function(term)
    if term.direction == "horizontal" then
      return 15
    elseif term.direction == "vertical" then
      return vim.o.columns * 0.4
    end
  end,
  open_mapping = [[<c-\>]],
  hide_numbers = false,
  shade_filetypes = {},
  shade_terminals = true,
  shading_factor = 3,
  start_in_insert = true,
  insert_mappings = true,
  terminal_mappings = true,
  persist_size = true,
  direction = "float",
  close_on_exit = true,
  shell = vim.o.shell,
  float_opts = {
    -- The border key is *almost* the same as 'nvim_open_win'
    -- see :h nvim_open_win for details on borders however
    -- the 'curved' border is a custom border type
    -- not natively supported but implemented in this plugin.
    --
    -- border = 'single' | 'double' | 'shadow' | 'curved' | ... other options supported by win open
    border = "curved",
    -- width = <value>,
    -- height = <value>,
    winblend = 3,
    highlights = {
      border = "Normal",
      background = "Normal",
    },
  },
}

-- Custom Terminals
local Terminal = require("toggleterm.terminal").Terminal

local lazygit = Terminal:new { cmd = "lazygit", count = 11 }
function _Toggleterm_lazygit()
  lazygit:toggle()
end

-- Init Default Terminal
-- Usefull in case another terminal is opened before the main one
local mainTerminal = Terminal:new { count = 1 }
mainTerminal:open() -- need to open because __add is private
mainTerminal:close()

require("core.mappings").toggleterm()
