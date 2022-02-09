local present, gitsigns = pcall(require, "gitsigns")

if not present then
  print "Warning: GitSigns not found"
  return
end

gitsigns.setup {
  current_line_blame_opts = {
    virt_text = true,
    virt_text_pos = "eol", -- 'eol' | 'overlay' | 'right_align'
    delay = 200,
    ignore_whitespace = true,
  },
}

require("core.mappings").gitsigns()
