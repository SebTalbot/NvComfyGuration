local telescope_present, telescope = pcall(require, "telescope")
if not telescope_present then
  print("Warning: Telescope not found")
  return
end

local builtin_present, builtin = pcall(require, "telescope.builtin")
if not builtin_present then
  print("Warning: telescope.builtin not found")
  return
end

local lga_present, lga_actions = pcall(require, "telescope-live-grep-args.actions")
if not lga_present then
  print("Warning: telescope-live-grep-args.actions not found")
  return
end

local actions = require("telescope.actions")
local actions_layout = require("telescope.actions.layout")

table.unpack = table.unpack or unpack

telescope.setup({
  defaults = {
    borderchars = { "─", "│", "─", "│", "┌", "┐", "┘", "└" },
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
      git_command = {
        "git",
        "log",
        "--pretty=%h %<(20,trunc)%an %ad %s",
        "--date=format:%Y-%m-%d %H:%M:%S",
      },
    },
    git_commits = {
      git_command = {
        "git",
        "log",
        "--pretty=%h %<(20,trunc)%an %ad %s",
        "--date=format:%Y-%m-%d %H:%M:%S",
        "--",
        ".",
      },
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
      additional_args = { "--hidden", "--no-ignore" },
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
    live_grep_args = {
      prompt_title = "Find Grep (Args)",
      auto_quoting = true, -- enable/disable auto-quoting
      -- define mappings, e.g.
      mappings = { -- extend mappings
        i = {
          ["<C-k>"] = lga_actions.quote_prompt(),
          ["<C-i>"] = lga_actions.quote_prompt({ postfix = " --iglob " }),
          -- freeze the current list and start a fuzzy search in the frozen list
          ["<C-space>"] = actions.to_fuzzy_refine,
        },
      },
      -- ... also accepts theme settings, for example:
      -- theme = "dropdown", -- use dropdown theme
      -- theme = { }, -- use own theme spec
      -- layout_config = { mirror=true }, -- mirror preview pane
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
})

-- Custom Telescope calls with file ignore
function _TelescopeFileIgnore()
  builtin.find_files({
    prompt_title = "Find Files (Ignore)",
    hidden = true,
    file_ignore_patterns = {
      -- Directories
      ".git/",
      "node_modules/",
      "%/test%/",
      "%/tests%/",
      "%.test%.",
      "%.tests%.",

      -- Non-text Files
      ".jpg$",
      ".jpeg$",
      ".gif$",
      ".bmp$",
      ".png$",
      ".woff$",

      -- OMY
      "^assets%/skinia",
      "^assets%/sdk%-",
      "^assets%/omy%-",
      "^assets%/account%-management%-",
      "^assets%/FaceDetectionService%-",
    },
  })
end

local ignorePatterns = {
  -- Directories
  ".git/*",
  "node_modules/*",
  "*/test/*",
  "*/tests/*",
  "*.test.*",
  "*.tests.*",

  -- Files
  "package-lock.json",

  -- OMY
  "assets/skinia*",
  "assets/sdk-*",
  "assets/omy-*",
  "assets/account-management-*",
  "assets/FaceDetectionService-*",
  "assets/theme.js",
}

 ---@param patterns string[]
 ---@return string[]
local GenerateRgIgnorePatterns = function(patterns)
  local result = {}
  for _, pattern in ipairs(patterns) do
    table.insert(result, "-g")
    table.insert(result, "!".. pattern)
  end
  return result
end

function _TelescopeWordIgnore()
  builtin.grep_string({
    prompt_title = "Find Words (Ignore)",
    vimgrep_arguments = {
      "rg",
      "--color=never",
      "--column",
      "--line-number",
      "--no-heading",
      "--trim",
      "--with-filename",
      table.unpack(GenerateRgIgnorePatterns(ignorePatterns))
    },
  })
end

function _TelescopeGrepIgnore()
  builtin.live_grep({
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
      table.unpack(GenerateRgIgnorePatterns(ignorePatterns))
    },
  })
end

-- Custom Theme
vim.cmd([[hi link TelescopeTitle TelescopeMatching]])

telescope.load_extension("dap")
telescope.load_extension("fzf")
telescope.load_extension("env")
telescope.load_extension("live_grep_args")
telescope.load_extension("termfinder")
telescope.load_extension('harpoon')
require("core.mappings").telescope()
