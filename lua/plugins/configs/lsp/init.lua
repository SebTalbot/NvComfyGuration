local present, lsp_installer = pcall(require, "mason-lspconfig")
if not present then
  print "Warning: Cannot find lsp_installer"
  return
end

lsp_installer.setup({
  automatic_installation = true
})


local lspconfig_present, lspconfig = pcall(require, "lspconfig")
if not lspconfig_present then
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
lspconfig.lua_ls.setup(handlers.inject(require("plugins.configs.lsp.settings.lua_ls")))
lspconfig.vimls.setup(handlers.inject({}))

lspconfig.pyright.setup(handlers.inject({}))

require("plugins.configs.lsp.settings.tsserver")
require("plugins.configs.lsp.handlers").setup()
require "plugins.configs.lsp.null_ls"
