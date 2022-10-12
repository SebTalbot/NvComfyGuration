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
-- local ttt = require('toggleterm.terminal')
local Terminal = require("toggleterm.terminal").Terminal

-- Broken with toggleterm update
-- local name_term = function (term, name)
--   vim.api.nvim_buf_set_name(term.bufnr, name)
--   ttt.get(term.id).name = name
-- end

-- local init_term = function (term, name)
--   term:spawn()
--   name_term(term, name)
-- end


local main_terminal = Terminal:new { count = 1 }
function _Toggleterm_main()
  main_terminal:toggle()
end
--
-- init_term(main_terminal, "Main")

local lazygit = Terminal:new { cmd = "lazygit", count = 11 }
function _Toggleterm_lazygit()
  lazygit:toggle()
  -- name_term(lazygit, "Git")
end

require("core.mappings").toggleterm()
