local present, lsp_installer = pcall(require, "nvim-lsp-installer")
if not present then
  print "Warning: Cannot find lsp_installer"
  return
end

lsp_installer.setup({
  automatic_installation = true
})


local LSPConfigPresent, lspconfig = pcall(require, "lspconfig")
if not LSPConfigPresent then
  print "Warning: Cannot find lspconfig"
  return
end

local handlers = require("plugins.configs.lsp.handlers")
lspconfig.bashls.setup(handlers.inject({}))
lspconfig.cssls.setup(handlers.inject({}))
lspconfig.dockerls.setup(handlers.inject({}))
lspconfig.emmet_ls.setup(handlers.inject({}))
lspconfig.eslint.setup(handlers.inject({}))
lspconfig.gopls.setup(handlers.inject({}))
lspconfig.graphql.setup(handlers.inject({}))
lspconfig.html.setup(handlers.inject({}))
lspconfig.jsonls.setup(handlers.inject(require("plugins.configs.lsp.settings.jsonls")))
lspconfig.sumneko_lua.setup(handlers.inject(require("plugins.configs.lsp.settings.sumneko_lua")))
lspconfig.tsserver.setup(handlers.inject(require("plugins.configs.lsp.settings.tsserver")))
lspconfig.vimls.setup(handlers.inject({}))

require("plugins.configs.lsp.handlers").setup()
require "plugins.configs.lsp.null_ls"
