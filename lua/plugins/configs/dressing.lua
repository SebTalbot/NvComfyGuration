local dressing_present, dressing = pcall(require, "dressing")
if not dressing_present then
  print "Warning: Cannot find dressing"
  return
end

dressing.setup {
  input = {
    enabled = true,
    insert_only = false,
  },
  select = {
    telescope = {
      borderchars = { "─", "│", "─", "│", "┌", "┐", "┘", "└" },
      layout_config = {
        vertical = {
          height = 0.5,
          width = 0.5,
          preview_cutoff = 40,
          prompt_position = "top",
        },
      },
      layout_strategy = "vertical",
    },
  },
}
