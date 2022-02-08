local present, telescope = pcall(require, "telescope")

if not present then
  print "Warning: Telescope not found"
  return
end

telescope.setup {
  defaults = {
    file_ignore_patterns = {
      "%.git",
    },
  },
  pickers = {
    find_files = {
      hidden = true,
    },
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
require("telescope").load_extension "env"
require("core.mappings").telescope()
