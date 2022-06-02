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
local ttt = require('toggleterm.terminal')
local Terminal = require("toggleterm.terminal").Terminal

local nameTerm = function (term, name)
  vim.api.nvim_buf_set_name(term.bufnr, name)
  ttt.get(term.id).name = name
end

local initTerm = function (term, name)
  term:spawn()
  nameTerm(term, name)
end

local mainTerminal = Terminal:new { count = 1 }
initTerm(mainTerminal, "Main")
function _Toggleterm_main()
  mainTerminal:open()
end

local lazygit = Terminal:new { cmd = "lazygit", count = 11 }
function _Toggleterm_lazygit()
  lazygit:toggle()
  nameTerm(lazygit, "Git")
end

require("core.mappings").toggleterm()
