local null_ls_status_ok, null_ls = pcall(require, "null-ls")
if not null_ls_status_ok then
  print "Warning: Cannot find Null-ls"
  return
end

--https://github.com/jose-elias-alvarez/null-ls.nvim/blob/main/doc/BUILTINS.md#code-actions 
local code_actions = null_ls.builtins.code_actions
local diagnostics = null_ls.builtins.diagnostics
local formatting = null_ls.builtins.formatting

null_ls.setup {
  debug = true,
  sources = {
    code_actions.eslint_d,
    code_actions.refactoring,
    formatting.prettier,
    formatting.stylua,
  },
}
