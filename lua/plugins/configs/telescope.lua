local telescopePresent, telescope = pcall(require, "telescope")
if not telescopePresent then
  print "Warning: Telescope not found"
  return
end

local builtinPresent, builtin = pcall(require, "telescope.builtin")
if not builtinPresent then
  print "Warning: telescope.builtin not found"
  return
end

local actions = require "telescope.actions"
local actions_layout = require "telescope.actions.layout"

telescope.setup {
  defaults = {
    dynamic_preview_title = true,
    entry_prefix = "",
    layout_config = { vertical = { height = 0.99, width = 0.99, prompt_position = "top" } },
    layout_strategy = "vertical",
    multi_icon = "",
    prompt_prefix = " >> ",
    scroll_strategy = "limit",
    selection_caret = "",
    sorting_strategy = "ascending",
    vimgrep_arguments = { "rg", "--color=never", "--column", "--line-number", "--no-heading", "--smart-case", "--trim", "--with-filename" },
    mappings = {
      i = {
        ["<C-a>"] = actions.toggle_all,
        ["<C-e>"] = actions_layout.toggle_preview,
        ["<M-n>"] = actions.results_scrolling_down,
        ["<M-p>"] = actions.results_scrolling_up,
        ["<C-\\>"] = actions.close,
      },
      n = {
        ["<C-\\>"] = actions.close,
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
    find_files = {
      prompt_title = "Find Files (All)",
      hidden = true,
    },
    git_bcommits = {
      git_command = { "git", "log", "--pretty=%h %<(20,trunc)%an %ad %s", "--date=format:%Y-%m-%d %H:%M:%S" },
    },
    git_commits = {
      git_command = { "git", "log", "--pretty=%h %<(20,trunc)%an %ad %s", "--date=format:%Y-%m-%d %H:%M:%S", "--", "." },
    },
    grep_string = {
      disable_coordinates = true,
      only_sort_text = true,
      path_display = { shorten = 4 },
      prompt_title = "Find Words (All)",
      search = "\\w",
      use_regex = true,
    },
    help_tags = {
      mappings = { i = { ["<CR>"] = actions.select_vertical } },
    },
    live_grep = {
      prompt_title = "Find Grep (All)",
      only_sort_text = true,
      path_display = { shorten = 4 },
      disable_coordinates = true,
    },
    lsp_definitions = {
      fname_width = 80,
      path_display = { shorten = 4 },
      trim_text = true,
    },
    lsp_implementations = {
      fname_width = 80,
      path_display = { shorten = 4 },
      trim_text = true,
    },
    lsp_references = {
      fname_width = 80,
      path_display = { shorten = 4 },
      trim_text = true,
    },
    lsp_type_definitions = {
      fname_width = 80,
      path_display = { shorten = 4 },
      trim_text = true,
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

-- Custom Telescope calls with file ignore
function _TelescopeFileIgnore()
  builtin.find_files {
    prompt_title = "Find Files (Ignore)",
    hidden = false,
    file_ignore_patterns = {
      "%.test%.",
      "%.tests%.",
    },
  }
end

function _TelescopeWordIgnore()
  builtin.grep_string {
    prompt_title = "Find Words (Ignore)",
    vimgrep_arguments = {
      "rg",
      "--color=never",
      "--column",
      "--line-number",
      "--no-heading",
      "--trim",
      "--with-filename",
      "-g",
      "!*.test.*",
      "-g",
      "!*.tests.*",
    },
  }
end

function _TelescopeGrepIgnore()
  builtin.live_grep {
    prompt_title = "Find Grep (Ignore)",
    vimgrep_arguments = {
      "rg",
      "--color=never",
      "--column",
      "--line-number",
      "--no-heading",
      "--smart-case",
      "--trim",
      "--with-filename",
      "-g",
      "!*.test.*",
      "-g",
      "!*.tests.*",
    },
  }
end

-- Custom Theme
vim.cmd [[hi link TelescopeTitle TelescopeMatching]]

require("telescope").load_extension "dap"
require("telescope").load_extension "fzf"
require("telescope").load_extension "env"
require("telescope").load_extension "termfinder"
require("core.mappings").telescope()
