local bufferline = require("bufferline")
bufferline.setup({
  options = {
    mode = "buffers",
    numbers = "none",
    themable = true,
    buffer_close_icon = "",
    close_icon = "",
    left_trunc_marker = "",
    right_trunc_marker = "",
    diagnostics = false,
    indicator = {
      icon = "x",
      style = "icon",
    },
    offsets = {
      {
        separator = false,
      },
    },
    separator_style = "thin",
    show_buffer_icons = false,
    show_buffer_close_icons = false,
    show_tab_indicators = false,
    show_duplicate_prefix = false,
    sort_by = "insert_at_end",
    always_show_bufferline = false,
    auto_toggle_bufferline = true,
  },
  highlights = {
    fill = {
      bg = {
        attribute = "bg",
        highlight = "lualine_b_inactive",
      },
    },

    background = {
      fg = {
        attribute = "fg",
        highlight = "lualine_b_inactive",
      },
      bg = {
        attribute = "bg",
        highlight = "lualine_b_inactive",
      },
    },
    buffer_selected = {
      fg = {
        attribute = "fg",
        highlight = "Character",
      },
      bg = {
        attribute = "bg",
        highlight = "lualine_b_normal",
      },
      bold = true,
    },
    buffer_visible = {
      fg = {
        attribute = "fg",
        highlight = "lualine_b_normal",
      },
      bg = {
        attribute = "bg",
        highlight = "lualine_b_inactive",
      },
      bold = true,
    },
    separator = {
      fg = {
        attribute = "fg",
        highlight = "lualine_b_inactive",
      },
      bg = {
        attribute = "bg",
        highlight = "lualine_b_inactive",
      },
    },
    indicator_selected = {
      fg = {
        attribute = "fg",
        highlight = "Character",
      },
      bg = {
        attribute = "bg",
        highlight = "lualine_b_normal",
      },
    },
    indicator_visible = {
      fg = {
        attribute = "fg",
        highlight = "lualine_b_inactive",
      },
      bg = {
        attribute = "bg",
        highlight = "lualine_b_inactive",
      },
    },
    close_button_selected = {
      fg = {
        attribute = "fg",
        highlight = "Character",
      },
      bg = {
        attribute = "bg",
        highlight = "lualine_b_normal",
      },
    },
    close_button_visible = {
      fg = {
        attribute = "fg",
        highlight = "lualine_b_inactive",
      },
      bg = {
        attribute = "bg",
        highlight = "lualine_b_inactive",
      },
    },
    close_button = {
      fg = {
        attribute = "fg",
        highlight = "lualine_b_inactive",
      },
      bg = {
        attribute = "bg",
        highlight = "lualine_b_inactive",
      },
    },
    modified_selected = {
      fg = {
        attribute = "fg",
        highlight = "Character",
      },
      bg = {
        attribute = "bg",
        highlight = "lualine_b_normal",
      },
    },
    modified_visible = {
      fg = {
        attribute = "fg",
        highlight = "Character",
      },
      bg = {
        attribute = "bg",
        highlight = "lualine_b_inactive",
      },
    },
    modified = {
      fg = {
        attribute = "fg",
        highlight = "Character",
      },
      bg = {
        attribute = "bg",
        highlight = "lualine_b_inactive",
      },
    },
  },
})
