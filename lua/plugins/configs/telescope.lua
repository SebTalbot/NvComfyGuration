local present, telescope = pcall(require, "telescope")

if not present then
  print "Warning: Telescope not found"
  return
end

local actions = require "telescope.actions"
local actions_layout = require "telescope.actions.layout"

telescope.setup {
  defaults = {
    multi_icon = "",
    selection_caret = "",
    prompt_prefix = " >> ",
    entry_prefix = "",
    sorting_strategy = "ascending",
    layout_strategy = "vertical",
    layout_config = {
      vertical = {
        height = 0.99,
        width = 0.99,
        prompt_position = "top",
      },
    },
    -- vimgrep_arguments = {
    --   "rg",
    --   "--color=never",
    --   "--no-heading",
    --   "--with-filename",
    --   "--column",
    --   "--smart-case",
    --   "--trim",
    -- },
    mappings = {
      i = {
        ["<C-a>"] = actions.toggle_all,
        ["<C-e>"] = actions_layout.toggle_preview,
        ["<M-n>"] = actions.results_scrolling_down,
        ["<M-p>"] = actions.results_scrolling_up,
      },
    },
  },
  pickers = {
    buffers = {
      mappings = {
        i = {
          ["<C-b>"] = actions.delete_buffer,
        },
      },
    },
    live_grep = {
      disable_coordinates = true,
      path_display = { "tail" },
    },
    help_tags = {
      mappings = {
        i = {
          ["<CR>"] = actions.select_vertical,
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
  extensions = {
    fzf = {
      fuzzy = true,
      override_generic_sorter = true,
      override_file_sorter = true,
      case_mode = "smart_case",
    },
    termfinder = {
      mappings = {
        rename_term = "<C-n>",
        delete_term = "<C-x>",
        vertical_term = "<C-v>",
        horizontal_term = "<C-h>",
        float_term = "<C-f>",
      },
    },
  },
}

require("telescope").load_extension "dap"
require("telescope").load_extension "fzf"
require("telescope").load_extension "env"
require("telescope").load_extension "termfinder"
require("core.mappings").telescope()
