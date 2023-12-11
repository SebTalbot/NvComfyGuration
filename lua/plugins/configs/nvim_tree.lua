require("nvim-tree").setup {
  disable_netrw = true,
  hijack_cursor = true,
  hijack_netrw = true,
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
    side = "left",
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
