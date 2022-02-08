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
    git_commits = {
      git_command = { "git", "log", "--pretty=format:%h %<(15,trunc)%an %ad %s", "--date=format:%Y-%m-%d %H:%M:%S", "--", "." },
    },
    git_bcommits = {
      git_command = { "git", "log", "--pretty=format:%h %<(15,trunc)%an %ad %s", "--date=format:%Y-%m-%d %H:%M:%S" },
    },
  },
}

require("telescope").load_extension "fzf"
require("telescope").load_extension "env"
require("core.mappings").telescope()
