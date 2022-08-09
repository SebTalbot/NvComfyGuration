require("nvim-tree").setup {
  filters = {
    dotfiles = false,
    custom = {},
  },
  git = {
    enable = false,
    ignore = false,
    timeout = 400,
  },
  view = {
    width = 30,
    height = 30,
    hide_root_folder = false,
    side = "left",
    mappings = {
      custom_only = false,
      list = {},
    },
    number = true,
    relativenumber = true,
    signcolumn = "auto",
  },
  actions = {
    open_file = {
      quit_on_open = true,
    },
  },
}

require("core.mappings").nvim_tree()
