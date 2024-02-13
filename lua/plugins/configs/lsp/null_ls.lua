local mason_null_ls_present, manson_null_ls = pcall(require, "mason-null-ls")
if not mason_null_ls_present then
  print "Warning: Cannot find mason-null-ls"
  return
end

local null_ls_present, null_ls = pcall(require, "null-ls")
if not null_ls_present then
  print "Warning: Cannot find null-ls"
  return
end

-- https://github.com/jose-elias-alvarez/null-ls.nvim/blob/main/doc/BUILTINS.md#code-actions
local code_actions = null_ls.builtins.code_actions
local diagnostics = null_ls.builtins.diagnostics
local formatting = null_ls.builtins.formatting

null_ls.setup {
  debug = true,
  sources = {
    code_actions.gitsigns,
    code_actions.eslint_d,
    diagnostics.golangci_lint,
    diagnostics.pylint.with {
      -- need python-pylint-venv
      extra_args = { "--init-hook", 'import sys; sys.path.append("/usr/lib/python3.11/site-packages"); import pylint_venv; pylint_venv.inithook(force_venv_activation=True, quiet=True)' },
    },
    formatting.beautysh,
    formatting.gofumpt,
    formatting.goimports,
    formatting.goimports_reviser,
    formatting.prettier,
    formatting.stylua,
  },
  on_attach = require("plugins.configs.lsp.handlers").on_attach,
}

manson_null_ls.setup {
  ensure_installed = {},
  automatic_installation = true,
}
