local tabnine_status_ok, tabnine = pcall(require, "tabnine")
if not tabnine_status_ok then
  return
end

tabnine.setup({
  disable_auto_comment=true,
  accept_keymap="<Tab>",
  dismiss_keymap = "<C-s>",
  debounce_ms = 300,
  suggestion_color = {gui = "#f7e163", cterm = 244},
  exclude_filetypes = {"TelescopePrompt"},
  log_file_path = nil,
})
