local status_ok, which_key = pcall(require, "which-key")
if not status_ok then
  print "Warning: Cannot find which_key"
  return
end

local setup = {}

local nmappings = {
  -- Better definitions
  ["<S-k>"] = "Hover definition",
  ["["] = "Previous motions",
  ["]"] = "Next motions",
  z = {
    name = "Misc",
  },
  g = {
    name = "Misc",
    c = "Comment",
  },

  -- Leader Menu
  ["<leader>"] = {
    name = "Leader menu",
    ["<leader>"] = "Default normal mapping",
    ["*"] = "Select word under cursor",
    ["/"] = "Hide word selection",
    ["h"] = "Neovim help search",
    -- a = {
    --   name = "Actions",
    -- },
    b = {
      name = "Buffers",
      b = "Back",
      n = "Next",
      p = "Previous",
      d = {
        name = "Close",
        d = "Current",
      },
        o = "Everything but the current",
    },
    e = {
      name = "Errors & Diagnostic [LSP]",
      e = "Open details",
      l = "List diagnostic in quickfix",
      n = "Next error",
      p = "Previous error",
    },
    f = {
      name = "Find",
      a = "All Files",
      b = "Buffers",
      f = "Files (not hidden)",
      w = "Live Grep",
    },
    l = {
      name = "LSP",
      d = "List definitions",
      i = "List implementations",
      l = "Jump to declaration",
      r = "List references",
      t = "List type definitions",
      a = {
        name = "Actions",
        a = "LSP code actions",
        r = "Rename word under the cursor",
        f = "Format file",
      }
    },
    n = {
      name = "Neotree",
      n = "Open on current file",
      t = "Toggle",
    },
    w = {
      name = "Windows",
      H = "Move position to right",
      J = "Move position to down",
      K = "Move position to up",
      L = "Move position to left",
      d = "Close current",
      h = "Select right",
      j = "Select down",
      k = "Select up",
      l = "Select left",
      s = "Split horizontal",
      v = "Split vertical",
      r = {
        name = "Resize",
        e = "Equal",
        r = "Smart",
      },
    },
    z = {
      name = "System files",
    },
  },
}

local vmappings = {}

which_key.setup(setup)
which_key.register(nmappings, { mode = "n" })
which_key.register(vmappings, { mode = "v" })
