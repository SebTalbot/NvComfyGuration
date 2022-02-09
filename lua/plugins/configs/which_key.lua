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
        o = "Everything but the current",
      },
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
      c = "Commands",
      f = "Files (not hidden)",
      r = "Resume last picker",
      w = "Live Grep",
    },
    g = {
      name = "Git",
      b = "Branches",
      c = "Project commits",
      C = "Current file commits",
      d = "Diff buffer",
      g = "Preview hunk",
      l = "Blame line",
      L = "Blame line with details",
      n = "Next hunk",
      p = "Previous hunk",
      s = "Status",
      S = "Stash",
      t = "Toggle diff",
      v = "Select hunk",
      a = {
        name = "Actions",
        r = "Reset hunk",
        R = "Reset file",
        s = "Stage hunk",
        S = "Stage file",
        t = "Stash every file",
        u = "Unstage file",
      }
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
      },
    },
    n = {
      name = "Nvim-tree",
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
    y = {
      name = "Special Yank",
      y = "File name",
      f = "File path",
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
