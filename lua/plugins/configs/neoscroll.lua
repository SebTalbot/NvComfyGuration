local present, neoscroll = pcall(require, "neoscroll")

if not present then
  print "Warning: Neoscroll not found"
  return
end

neoscroll.setup {
  mappings = { "<C-u>", "<C-d>", "<C-b>", "<C-f>", "<C-y>", "<C-e>", "zt", "zz", "zb" },
  hide_cursor = false,
}
