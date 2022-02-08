local status_ok, which_key = pcall(require, "which-key")
if not status_ok then
  print "Warning: Cannot find which_key"
  return
end

local setup = {}

local nmappings = {
  ["<leader>"] = {
    w = {
      name = "Windows",
      H = "Move Position to Right",
      J = "Move Position to Down",
      K = "Move Position to Up",
      L = "Move Position to Left",
      d = "Close Current",
      h = "Select Right",
      j = "Select Down",
      k = "Select Up",
      l = "Select Left",
      s = "Split Horizontal",
      v = "Split Vertical",
      r = {
        name = "Resize",
        e = "Equal",
        r = "Smart",
      },
    },
  },
}

local vmappings = {}

which_key.setup(setup)
which_key.register(nmappings, { mode = "n" })
which_key.register(vmappings, { mode = "v" })
