local status_ok, _ = pcall(require, "lspconfig")
if not status_ok then
  print("Warning: Cannot find lspconfig")
	return
end

require("plugins.configs.lsp.lsp_install")
require("plugins.configs.lsp.handlers").setup()

