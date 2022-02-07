local present, telescope = pcall(require, "telescope")

if not present then
  print "Warning: Telescope not found"
  return
end

telescope.setup {
  pickers = {
    help_tags = {
      mappings = {
        i = {
          ["<CR>"] = require("telescope.actions").select_vertical,
        },
      },
    },
  },
}

require("telescope").load_extension "fzf"
require("core.mappings").telescope()
